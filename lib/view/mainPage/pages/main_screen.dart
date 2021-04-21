import 'package:facebook_2/view/editProfile/pages/edit_profile.dart';
import 'package:facebook_2/view/mainPage/widgets/dodaj_post_widget.dart';
import 'package:facebook_2/view/mainPage/widgets/sign_out_widget.dart';
import 'package:facebook_2/view/mainPage/widgets/title_widget.dart';
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfile(),
                ),
              );
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
