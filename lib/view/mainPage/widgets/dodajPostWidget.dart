import 'package:facebook_2/utils/style/textAreaDecoration.dart';
import 'package:flutter/material.dart';

Widget dodajPostWidget() {
  return Container(
    decoration: textAreaDecoration(),
    child: Padding(
      padding: EdgeInsets.all(8),
      child: TextField(
        maxLines: 8,
        decoration:
            InputDecoration.collapsed(hintText: "O čemu razmišljate...?"),
      ),
    ),
  );
}
