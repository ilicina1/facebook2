import 'package:facebook_2/utils/style/style.dart';
import 'package:facebook_2/viewModel/main_screen_view_model/main_screen_view_model.dart';
import 'package:flutter/material.dart';

Widget signOutWidget(context) {
  return FlatButton(
    child: Text("Odjavi se"),
    onPressed: () {
      googleSignOut(context);
    },
    shape: RoundedRectangleBorder(
      side: signOutButtonSyle(),
    ),
  );
}
