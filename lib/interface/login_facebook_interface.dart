import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

abstract class LoginFacebookInterface {
  void initiateFacebookLogin(context) async {}
  Future<Null> logOut(context) async {}
}
