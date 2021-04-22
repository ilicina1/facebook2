import 'package:facebook_2/view/mainPage/widgets/list_view_posts.dart';
import 'package:facebook_2/view/mainPage/widgets/route_edit_profile.dart';
import 'package:facebook_2/view/mainPage/widgets/text_field_widget.dart';
import 'package:facebook_2/view/mainPage/widgets/sign_out_widget.dart';
import 'package:facebook_2/view/mainPage/widgets/title_widget.dart';
import 'package:facebook_2/view/mainPage/widgets/array_of_buttons.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

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
            onPressed: () => editProfile(context),
          ),
          signOutWidget(context),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            textFieldWidget(),
            arrayOfButtonsStat(context),
            ListViewPosts(),
          ],
        ),
      ),
    );
  }
}
