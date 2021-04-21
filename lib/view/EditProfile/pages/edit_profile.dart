import 'package:facebook_2/utils/style/facebookLogoText.dart';
import 'package:facebook_2/view/editProfile/widgets/profile_editables.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

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
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading user...');
            return ProfileEditables(context, snapshot.data.docs[0]);
          },
        ),
      ),
    );
  }
}
