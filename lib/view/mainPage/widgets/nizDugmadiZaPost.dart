import 'package:facebook_2/services/mainScreen/dodajSliku.dart';
import 'package:facebook_2/utils/style/postButtonStyle.dart';
import 'package:facebook_2/view/mainPage/pages/mainScreen.dart';
import 'package:flutter/material.dart';

Widget nizDugmadiZaPost(BuildContext context) {
  return Row(
    children: <Widget>[
      FlatButton.icon(
        icon: Icon(Icons.camera),
        label: Text('Kamera'),
        onPressed: () {
          //
        },
      ),
      FlatButton.icon(
        icon: Icon(Icons.image),
        label: Text('Slika ili video'),
        onPressed: () {
          AddingImages().imgFromGallery();
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
