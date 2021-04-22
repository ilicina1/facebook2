import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:facebook_2/view/IogInView/pages/login_screen.dart';
import 'package:facebook_2/view/mainPage/pages/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

final FacebookLogin facebookLogIn = FacebookLogin();

void initiateFacebookLogin(context) async {
  facebookLogIn.loginBehavior = FacebookLoginBehavior.webViewOnly;
  var facebookLoginResult =
      await facebookLogIn.logInWithReadPermissions(['public_profile', 'email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
      // final result = await FacebookAuth.instance
      //     .login(permissions: ['email', 'user_birthday']);
      // print(result.toJson());
      //
      final token = facebookLoginResult.accessToken.token;

      print(
          'Facebook token userID : ${facebookLoginResult.accessToken.permissions}');
      // final graphResponse = await http.get(Uri.https(
      //     'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}',
      //     '/assets'));

      // final profile = jsonDecode(graphResponse.body);
      // print(profile);

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
