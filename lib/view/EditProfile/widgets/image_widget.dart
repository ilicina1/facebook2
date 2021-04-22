import 'dart:io';
import 'package:facebook_2/utils/dummyData/dummyData.dart';
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
  var imageToSend2;
  String url;
  var url2;
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
        uploadImage(image);
      } else {
        image =
            'https://i0.wp.com/www.ahpsfivedock.catholic.edu.au/wp-content/uploads/sites/18/2019/05/Person-icon.jpg?ssl=1';
      }
    });
  }

  Future<String> uploadImage(var imageFile) async {
    FirebaseStorage storage = FirebaseStorage.instance;

    await firebase_storage.FirebaseStorage.instance
        .ref('new/photo.jpg')
        .putFile(image);
    imageToSend2 = await firebase_storage.FirebaseStorage.instance
        .ref('new/photo.jpg')
        .getDownloadURL();

    return imageToSend2;
  }

//radi kad se 2x ucita, firebase se odmah loaduje. problem znaci u ucitavanju widgeta
//i kad se tek startuje aplikacija, firebase je tacan od prethodnog logina, ne promijeni pocetnu profilnu sliku
//dakle samo je u widgetu problem tj u njegovom refreshu ili buildu koji kasni malo pa treba 2x ponoviti postupak
//izbora profilne slike
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: GestureDetector(
            onTap: () async {
              await getImageGallery();

              User userTrenutni = FirebaseAuth.instance.currentUser;

              FirebaseFirestore _db = FirebaseFirestore.instance;

              await FirebaseFirestore.instance
                  .collection('users')
                  .where('email', isEqualTo: userTrenutni.email)
                  .limit(1)
                  .get()
                  .then((doc) {
                konacniURL = doc.docs[0]['profile_picture'];
              });

              final CollectionReference colRef = _db.collection("users");
              colRef.doc(userTrenutni.email).set({
                'profile_picture': konacniURL,
              }, SetOptions(merge: true));
              setState(() {});
            },
            child: CircleAvatar(
              backgroundImage: konacniURL != null
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
