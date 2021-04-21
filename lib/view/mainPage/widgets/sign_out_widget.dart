import 'package:facebook_2/utils/style/signOutButtonDecoration.dart';
import 'package:facebook_2/viewModel/login_view_model.dart';
import 'package:flutter/material.dart';

Widget signOutWidget(context) {
  return FlatButton(
      child: Text("Odjavi se"),
      onPressed: () {
        //signOut();
        logout(context);
      },
      shape: RoundedRectangleBorder(
        side: signOutButtonSyle(),
      ));
}
