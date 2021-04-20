import 'package:facebook_2/view/IogInView/pages/login_screen.dart';
import 'package:facebook_2/view/mainPage/pages/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

final FacebookLogin facebookLogIn = FacebookLogin();

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

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<Null> logOut(context) async {
  await facebookLogIn.logOut();
  await _auth.signOut();

  print('Logged out.');
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => LogInScreen(),
    ),
  );
}
