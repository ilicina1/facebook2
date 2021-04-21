import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:facebook_2/utils/dummyData/dummyData.dart';

class UploadImage extends StatefulWidget {
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  final picker = ImagePicker();

  Future getImageCam() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        print("image selected");
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        print(image.path);
        print("image selected");
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: getImageCam,
          child: Icon(
            Icons.add_a_photo,
            color: Colors.blue[900],
          ),
        ),
        TextButton(
          onPressed: getImageGallery,
          child: Icon(
            Icons.photo_album,
            color: Colors.blue[900],
          ),
        )
      ],
    );
  }
}
