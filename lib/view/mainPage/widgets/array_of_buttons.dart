import 'package:facebook_2/utils/style/style.dart';
import 'package:facebook_2/view/mainPage/widgets/upload_image.dart';
import 'package:facebook_2/viewModel/main_screen_view_model/upload_post_view_model.dart';
import 'package:flutter/material.dart';

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
