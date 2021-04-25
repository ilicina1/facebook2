import 'dart:io';
import 'package:facebook_2/utils/dummyData/dummyData.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostImageNotifier extends ChangeNotifier {
  final picker = ImagePicker();

  Future getImageCam() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      print("image selected");
    } else {
      print('No image selected.');
    }

    notifyListeners();
  }

  Future getImageGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      print(image.path);
      print("image selected");
    } else {
      print('No image selected.');
    }

    notifyListeners();
  }
}
