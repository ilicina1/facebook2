import 'package:facebook_2/utils/style/style.dart';
import 'package:facebook_2/view/IogInView/pages/logInScreen.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 2,
        navigateAfterSeconds: new LogInScreen(),
        title: new Text(
          'Welcome To Facebook',
          style: splashStyle,
        ),
        image: new Image.asset("assets/images/facebook.png"),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.blue[900]);
  }
}
