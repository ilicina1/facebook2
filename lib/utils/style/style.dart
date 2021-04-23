import 'package:flutter/material.dart';

TextStyle splashStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20.0,
);

TextStyle loginButton = TextStyle(
  color: Colors.black,
  fontSize: 25,
);

TextStyle textUpravljajSlikama =
    TextStyle(color: Colors.grey, letterSpacing: 1.5, fontSize: 14);

TextStyle textUpravljajVideoZapisima =
    TextStyle(color: Colors.grey, letterSpacing: 1.5, fontSize: 14);

BorderSide signOutButtonSyle() {
  return BorderSide(color: Colors.transparent, width: 0.0);
}

TextStyle facebookDecoration() {
  return TextStyle(fontSize: 18.0, color: Colors.blue[900], letterSpacing: 2);
}

ButtonStyle postButtonSyle() {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[900]),
  );
}

BoxDecoration textAreaDecoration() {
  return BoxDecoration(
    border: Border.all(
      color: Colors.blue[900],
    ),
    borderRadius: BorderRadius.circular(10.0),
  );
}
