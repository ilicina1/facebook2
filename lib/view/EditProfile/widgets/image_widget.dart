import 'dart:io';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ImageWidget2 extends StatefulWidget {
  ImageWidget2(BuildContext context);

  @override
  _ImageWidget2State createState() => _ImageWidget2State();
}

class _ImageWidget2State extends State<ImageWidget2> {
  User userTrenutni = FirebaseAuth.instance.currentUser;
  var imageToSend;

  final picker = ImagePicker();
  var image;
  var postoji = false;

  Future getImageCam() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        print("image selected");
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        print(image.path);
        print("image selected");
        postoji = true;
        //ovdje ubaciti sliku u storage odmah
        //
      } else {
        image =
            'https://i0.wp.com/www.ahpsfivedock.catholic.edu.au/wp-content/uploads/sites/18/2019/05/Person-icon.jpg?ssl=1';
      }
    });
  }

  Future uploadImg() async {
    if (image == null) return;

    final fileName = basename(image.path);
    final destination = 'files/$fileName';

    final ref = FirebaseStorage.instance.ref(destination);

    ref.putFile(image);

    imageToSend = await firebase_storage.FirebaseStorage.instance
        // .ref('posts/${user.email}/${imageName[imageName.length - 1]}')
        .ref('files/${fileName[fileName.length - 1]}')
        .getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      //crossAxisAlignment: CrossAxisAlignment.baseline,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: GestureDetector(
            onTap: () async {
              getImageGallery();
              uploadImg();

              User userTrenutni = FirebaseAuth.instance.currentUser;

              FirebaseFirestore _db = FirebaseFirestore.instance;

              final CollectionReference colRef = _db.collection("users");

              colRef.doc(userTrenutni.uid).set({
                'profile_picture': '$imageToSend',
              }, SetOptions(merge: true));
            },
            child: CircleAvatar(
              backgroundImage: postoji
                  ? NetworkImage('$imageToSend')
                  : NetworkImage(
                      'https://i0.wp.com/www.ahpsfivedock.catholic.edu.au/wp-content/uploads/sites/18/2019/05/Person-icon.jpg?ssl=1'),
              radius: 80.0,
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
