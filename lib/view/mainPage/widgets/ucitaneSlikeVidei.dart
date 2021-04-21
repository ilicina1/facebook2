import 'package:facebook_2/services/mainScreen/dodajSliku.dart';
import 'package:flutter/material.dart';

Widget ucitaneSlikeVidei() {
  return AddingImages().image != null
      ? ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.file(
            AddingImages().image,
            width: 100,
            height: 100,
            fit: BoxFit.fitHeight,
          ),
        )
      : Container(
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(50)),
          width: 100,
          height: 100,
          child: Icon(
            Icons.camera_alt,
            color: Colors.grey[800],
          ),
        );
}
