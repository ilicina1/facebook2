import 'package:facebook_2/view/mainPage/widgets/dodajPostWidget.dart';
import 'package:facebook_2/view/mainPage/widgets/signOutWidget.dart';
import 'package:facebook_2/view/mainPage/widgets/titleWidget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: titleWidget(),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Uredi profil'),
            onPressed: () {
              //uredi profil
            },
          ),
          signOutWidget(),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            dodajPostWidget(),
          ],
        ),
      ),
    );
  }
}
