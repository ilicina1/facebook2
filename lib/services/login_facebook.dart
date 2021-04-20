import 'package:facebook_2/main.dart';
import 'package:facebook_2/view/mainPage/pages/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

void initiateFacebookLogin(context) async {
  var facebookLoginResult =
      await facebookLogIn.logInWithReadPermissions(['email']);
  switch (facebookLoginResult.status) {
    case FacebookLoginStatus.error:
      print("Error");
      // onLoginStatusChanged(false);
      break;
    case FacebookLoginStatus.cancelledByUser:
      print("CancelledByUser");
      // onLoginStatusChanged(false);
      break;
    case FacebookLoginStatus.loggedIn:
      print("LoggedIn");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ),
      );
      break;
  }
}

void logoutFacebook() async {
  await facebookLogIn.logOut();
  print("User Sign Out");
}
