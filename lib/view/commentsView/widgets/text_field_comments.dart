import 'package:facebook_2/utils/style/textAreaDecoration.dart';
import 'package:flutter/material.dart';

final myControllerComments = TextEditingController();

Widget textFieldComments() {
  return Container(
    height: 100,
    decoration: textAreaDecoration(),
    child: Padding(
      padding: EdgeInsets.all(8),
      child: TextField(
        controller: myControllerComments,
        maxLines: 8,
        decoration: InputDecoration.collapsed(
          hintText: "Napiši komentar... ",
        ),
      ),
    ),
  );
}
