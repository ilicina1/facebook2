import 'package:facebook_2/utils/style/postButtonStyle.dart';
import 'package:flutter/material.dart';

Widget commentButton() {
  return ElevatedButton(
    child: Text(
      'Komentariši',
      style: TextStyle(color: Colors.white),
    ),
    style: postButtonSyle(),
    onPressed: () {
      //uredi profil
      //uploadPostModel();
    },
  );
}
