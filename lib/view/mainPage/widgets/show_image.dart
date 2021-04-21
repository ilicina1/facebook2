import 'package:facebook_2/utils/dummyData/dummyData.dart';
import 'package:flutter/material.dart';

class ShowImage extends StatefulWidget {
  @override
  _ShowImageState createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: Center(
        child: image == null ? Text('No image selected.') : Image.file(image),
      ),
    );
  }
}
