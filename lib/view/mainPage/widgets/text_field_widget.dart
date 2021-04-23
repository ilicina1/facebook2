import 'package:facebook_2/utils/style/style.dart';
import 'package:flutter/material.dart';

final myController = TextEditingController();

Widget textFieldWidget() {
  return Container(
    decoration: textAreaDecoration(),
    child: Padding(
      padding: EdgeInsets.all(8),
      child: TextField(
        controller: myController,
        maxLines: 8,
        decoration: InputDecoration.collapsed(
          hintText: "What's on your mind?",
        ),
      ),
    ),
  );
}
