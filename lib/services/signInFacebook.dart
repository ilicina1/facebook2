import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

void initiateFacebookLogin() async {
  var facebookLogin = FacebookLogin();
  var facebookLoginResult =
      await facebookLogin.logInWithReadPermissions(['email']);
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
      // onLoginStatusChanged(true);
      break;
  }
  print("${facebookLogin.isLoggedIn} ss");
}

Future<void> login() async {
  final FacebookLogin facebookSignIn = new FacebookLogin();

  final FacebookLoginResult result =
      await facebookSignIn.logInWithReadPermissions(['email']);

  switch (result.status) {
    case FacebookLoginStatus.loggedIn:
      final FacebookAccessToken accessToken = result.accessToken;
      print('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
      break;
    case FacebookLoginStatus.cancelledByUser:
      print('Login cancelled by the user.');
      break;
    case FacebookLoginStatus.error:
      print('Something went wrong with the login process.\n'
          'Here\'s the error Facebook gave us: ${result.errorMessage}');
      break;
  }
}

// bool isLoggedIn = false;

// void onLoginStatusChanged(bool isLoggedIn) {
//   setState(() {
//     this.isLoggedIn = isLoggedIn;
//   });
// }

@override
Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Facebook Login"),
      ),
      body: Container(
        child: Center(
          child: TextButton(
            child: Text("Login with Facebook"),
            onPressed: () => initiateFacebookLogin(),
          ),
        ),
      ),
    ),
  );
}
