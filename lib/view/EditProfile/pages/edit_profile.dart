import 'package:facebook_2/utils/style/style.dart';
import 'package:facebook_2/view/EditProfile/widgets/profile_editables.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'FACEBOOK',
          style: facebookDecoration(),
        ),
      ),
      body: SafeArea(
        child: ProfileEditables(),
      ),
    );
  }
}
