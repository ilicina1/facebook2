import 'package:facebook_2/utils/style/postButtonStyle.dart';
import 'package:flutter/material.dart';

Widget nizDugmadiZaPost() {
  return Row(
    children: <Widget>[
      FlatButton.icon(
        icon: Icon(Icons.image),
        label: Text('Dodaj sliku'),
        onPressed: () {
          //uredi profil
        },
      ),
      FlatButton.icon(
        icon: Icon(Icons.video_label),
        label: Text('Dodaj video'),
        onPressed: () {
          //uredi profil
        },
      ),
      ElevatedButton(
        child: Text('Objavi', style: TextStyle(color: Colors.white)),
        style: postButtonSyle(),
        onPressed: () {
          //uredi profil
        },
      ),
    ],
  );
}
