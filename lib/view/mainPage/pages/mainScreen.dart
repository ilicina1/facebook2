import 'dart:async';
import 'dart:io';

import 'package:facebook_2/services/mainScreen/dodajSliku.dart';
import 'package:facebook_2/view/mainPage/widgets/dodajPostWidget.dart';
import 'package:facebook_2/view/mainPage/widgets/nizDugmadiZaPost.dart';
import 'package:facebook_2/view/mainPage/widgets/signOutWidget.dart';
import 'package:facebook_2/view/mainPage/widgets/titleWidget.dart';
import 'package:facebook_2/view/mainPage/widgets/ucitaneSlikeVidei.dart';
import 'package:facebook_2/view/mainPage/widgets/urediProfilWidget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _now;
  Timer _everySecond;

  @override
  void initState() {
    super.initState();

    // sets first value
    _now = DateTime.now().second.toString();

    // defines a timer
    _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _now = DateTime.now().second.toString();
        //print(AddingImages().image.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: titleWidget(),
        actions: <Widget>[
          urediProfilWidget(),
          signOutWidget(),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            dodajPostWidget(),
            nizDugmadiZaPost(context),
            ucitaneSlikeVidei(),
          ],
        ),
      ),
    );
  }
}
