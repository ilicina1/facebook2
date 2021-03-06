import 'package:facebook_2/providers/comment_notifier.dart';
import 'package:facebook_2/providers/likes_notifier.dart';
import 'package:facebook_2/providers/post_image_notifier.dart';
import 'package:facebook_2/providers/post_notifier.dart';
import 'package:facebook_2/providers/profile_image_notifier.dart';
import 'package:facebook_2/utils/style/style.dart';
import 'package:facebook_2/view/IogInView/pages/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CommentNotifier()),
        ChangeNotifierProvider.value(value: ProfileImageNotifier()),
        ChangeNotifierProvider.value(value: PostImageNotifier()),
        ChangeNotifierProvider.value(value: PostNotifier()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new MyApp(),
      ),
    ),
  );
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
