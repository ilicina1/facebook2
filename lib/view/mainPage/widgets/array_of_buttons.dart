import 'package:facebook_2/services/login_screen_services/login_facebook.dart';
import 'package:facebook_2/utils/dummyData/dummyData.dart';
import 'package:facebook_2/utils/style/postButtonStyle.dart';
import 'package:facebook_2/view/mainPage/widgets/upload_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

Future uploadFile() async {
  await FirebaseAuth.instance.signInAnonymously();

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  try {
    await firebase_storage.FirebaseStorage.instance
        .ref('posts/file-to-upload.png')
        .putFile(image);
  } catch (e) {
    print("failll");
  }

  // firebase_storage.ListResult result =
  //     await firebase_storage.FirebaseStorage.instance.ref().listAll();

  // result.items.forEach((firebase_storage.Reference ref) {
  //   print('Found file: $ref');
  // });
}

Widget arrayOfButtonsStat(BuildContext context) {
  return Row(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          UploadImage(),
          ElevatedButton(
            child: Text(
              'Objavi',
              style: TextStyle(color: Colors.white),
            ),
            style: postButtonSyle(),
            onPressed: () {
              //uredi profil
              uploadFile();
            },
          ),
        ],
      ),
    ],
  );
}
