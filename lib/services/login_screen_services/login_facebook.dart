import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_2/view/IogInView/pages/login_screen.dart';
import 'package:facebook_2/view/mainPage/pages/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
User user;
FacebookLogin facebookLogin = FacebookLogin();
bool isSignIn = false;

Future<void> handleLogin(context) async {
  // facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
  final FacebookLoginResult result =
      await facebookLogin.logInWithReadPermissions(['email']);
  switch (result.status) {
    case FacebookLoginStatus.cancelledByUser:
      break;
    case FacebookLoginStatus.error:
      break;
    case FacebookLoginStatus.loggedIn:
      try {
        await loginWithfacebook(result, context);
      } catch (e) {
        print(e);
      }
      break;
  }
}

Future loginWithfacebook(FacebookLoginResult result, context) async {
  final FacebookAccessToken accessToken = result.accessToken;
  AuthCredential credential =
      FacebookAuthProvider.credential(accessToken.token);
  var a = await _auth.signInWithCredential(credential);
  isSignIn = true;
  user = a.user;

  if (user != null) {}

  final snapShot = await FirebaseFirestore.instance
      .collection('users')
      .doc(user.email)
      .get();

  if (snapShot.exists) {
    // Document already exists, ne raditi nista
  } else {
    FirebaseFirestore.instance.collection("users").doc(user.email).set({
      "name": user.displayName,
      "profile_picture":
          'https://i0.wp.com/www.ahpsfivedock.catholic.edu.au/wp-content/uploads/sites/18/2019/05/Person-icon.jpg?ssl=1',
      "email": user.email,
      "email_verified": user.emailVerified,
    }).then((value) {
      print(user.uid);
    });
  }

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => MainScreen(),
    ),
  );
}

Future<void> googleSignout(context) async {
  await _auth.signOut().then((onValue) {
    facebookLogin.logOut();
    isSignIn = false;
  });

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => LogInScreen(),
    ),
  );
}
