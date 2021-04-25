import 'package:flutter/material.dart';

class Photo extends StatelessWidget {
  final String image;
  Photo({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Image.network(image), Text('bla')],
    );
  }
}
