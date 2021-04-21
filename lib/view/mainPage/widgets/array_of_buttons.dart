import 'package:facebook_2/utils/style/postButtonStyle.dart';
import 'package:facebook_2/view/mainPage/widgets/upload_image.dart';
import 'package:facebook_2/viewModel/main_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

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
              uploadPostModel();
            },
          ),
        ],
      ),
    ],
  );
}
