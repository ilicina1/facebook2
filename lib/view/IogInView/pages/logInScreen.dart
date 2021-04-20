import 'package:facebook_2/services/logInFacebook.dart';
import 'package:facebook_2/view/IogInView/widgets/facebookLogo.dart';
import 'package:facebook_2/view/mainPage/pages/mainScreen.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            FaceBookLogo(),
            TextButton(
              onPressed: () {
                initiateFacebookLogin();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScreen(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "SignIn",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.login,
                    color: Colors.blue[900],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
