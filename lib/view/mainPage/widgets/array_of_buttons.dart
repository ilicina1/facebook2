import 'package:facebook_2/services/login_screen_services/login_facebook.dart';
import 'package:facebook_2/services/main_screen_services/addPost.dart';
import 'package:facebook_2/utils/dummyData/dummyData.dart';
import 'package:facebook_2/utils/style/postButtonStyle.dart';
import 'package:facebook_2/view/mainPage/widgets/upload_image.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

Future uploadFile() async {
  // inicijalizacija
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  // splitamo image path da bi dobili njegov naziv
  List<String> imageName = image.path.split('/');

  // za svakog usera koji postavi nesto spasavamo sliku u posts/njegovUserId/nazivSlike
  try {
    await firebase_storage.FirebaseStorage.instance
        .ref('posts/${accessToken.userId}/${imageName[imageName.length - 1]}')
        .putFile(image);
    addPost(imageName[imageName.length - 1], "ss", accessToken.userId);
  } catch (e) {
    print("Fail firebase storage");
  }

  firebase_storage.ListResult result =
      await firebase_storage.FirebaseStorage.instance.ref('posts').listAll();

  result.items.forEach((firebase_storage.Reference ref) {
    print('Found file: $ref');
  });
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
