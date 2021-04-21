import 'package:facebook_2/view/EditProfile/pages/edit_profile.dart';
import 'package:flutter/material.dart';

void editProfile(context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => EditProfile(),
    ),
  );
}
