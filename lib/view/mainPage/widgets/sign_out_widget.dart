import 'package:facebook_2/viewModel/main_screen_view_model/main_screen_view_model.dart';
import 'package:flutter/material.dart';

Widget signOutWidget(context) {
  return TextButton(
    child: Text(
      "Odjavi se",
      style: TextStyle(color: Colors.black),
    ),
    onPressed: () {
      googleSignOut(context);
    },
  );
}
