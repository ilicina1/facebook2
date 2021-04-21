import 'package:facebook_2/services/login_screen_services/login_facebook.dart';
import 'package:facebook_2/utils/style/signOutButtonDecoration.dart';
import 'package:facebook_2/viewModel/main_screen_view_model.dart';
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
