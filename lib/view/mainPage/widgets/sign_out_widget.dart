import 'package:facebook_2/utils/style/signOutButtonDecoration.dart';
import 'package:flutter/material.dart';

Widget signOutWidget() {
  return FlatButton(
      child: Text("Odjavi se"),
      onPressed: () {
        //signOut();
      },
      shape: RoundedRectangleBorder(
        side: signOutButtonSyle(),
      ));
}