import 'package:facebook_2/view/IogInView/pages/login_screen.dart';
import 'package:facebook_2/view/mainPage/pages/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

final FacebookLogin facebookLogIn = FacebookLogin();

void initiateFacebookLogin(context) async {
  facebookLogIn.loginBehavior = FacebookLoginBehavior.webViewOnly;

  var facebookLoginResult =
      await facebookLogIn.logInWithReadPermissions(['public_profile', 'email']);

  switch (facebookLoginResult.status) {
    case FacebookLoginStatus.error:
      print("Error");
      break;
    case FacebookLoginStatus.cancelledByUser:
      print("CancelledByUser");
      break;
    case FacebookLoginStatus.loggedIn:
      print("LoggedIn");

      final FacebookAccessToken accessToken = facebookLoginResult.accessToken;

      if (accessToken != null) {
        accessToken.permissions.forEach((element) {
          print(element);
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ),
        );
      }
      break;
  }
}

Future<Null> logOut(context) async {
  await facebookLogIn.logOut();
  await FacebookAuth.instance.logOut();

  print('Logged out.');
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => LogInScreen(),
    ),
  );
}
