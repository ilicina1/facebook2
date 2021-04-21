import 'package:facebook_2/utils/style/postButtonStyle.dart';
import 'package:facebook_2/view/mainPage/widgets/upload_image.dart';
import 'package:flutter/material.dart';

Widget arrayOfButtonsStat(BuildContext context) {
  return Row(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          UploadImage(),
          ElevatedButton(
            child: Text('Objavi', style: TextStyle(color: Colors.white)),
            style: postButtonSyle(),
            onPressed: () {
              //uredi profil
            },
          ),
        ],
      ),
    ],
  );
}
