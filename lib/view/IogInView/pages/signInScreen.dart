import 'package:facebook_2/services/signInFacebook.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SafeArea(child: Text("")),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  // signInWithFacebook();
                  initiateFacebookLogin();
                },
                child: Text(
                  "SignIn",
                  style: TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
