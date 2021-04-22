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
  String url;
  var url2;
  var konacniURL;
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
        postoji = true;
        //ovdje ubaciti sliku u storage odmah
        //
        uploadImage(image);
      } else {
        image =
            'https://i0.wp.com/www.ahpsfivedock.catholic.edu.au/wp-content/uploads/sites/18/2019/05/Person-icon.jpg?ssl=1';
      }
    });
  }

  Future<String> uploadImage(var imageFile) async {
    FirebaseStorage storage = FirebaseStorage.instance;

    Reference ref = storage.ref().child("/photo.jpg");
    UploadTask uploadTask = ref.putFile(imageFile);

    url2 = await ref.getDownloadURL();

    var dowurl =
        await (await uploadTask.whenComplete(() => ref.getDownloadURL()));
    url = dowurl.toString();

    print(url2);

    return url2;
  }

  /* Future uploadImg() async {
    if (image == null) return;

    final fileName = basename(image.path);

    print(fileName);
    final destination = 'files/$fileName';

    print(destination);

    final ref = FirebaseStorage.instance.ref('files/$fileName');

    ref.putFile(image);

    imageToSend = await FirebaseStorage.instance
        // .ref('posts/${user.email}/${imageName[imageName.length - 1]}')
        .ref('files/$fileName')
        .getDownloadURL();

    print(imageToSend);
  }*/
//radi kad se 2x ucita. treba uzimati sliku ne iz url2 nego iz snapshota da zauvijek ostane tu
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
              await getImageGallery();

              User userTrenutni = FirebaseAuth.instance.currentUser;

              FirebaseFirestore _db = FirebaseFirestore.instance;

              final CollectionReference colRef = _db.collection("users");
              colRef.doc(userTrenutni.uid).set({
                'profile_picture': url2.toString(),
              }, SetOptions(merge: true));

              final snep = await FirebaseFirestore.instance
                  .collection('users')
                  .doc(userTrenutni.uid)
                  .get();

              konacniURL = snep['profile_picture'];
              print(konacniURL);
            },
            child: CircleAvatar(
              backgroundImage: postoji
                  ? NetworkImage('$konacniURL')
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
