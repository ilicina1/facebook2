import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:facebook_2/view/commentsView/widgets/text_field_comments.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImageNotifier extends ChangeNotifier {
  var profileImage;

  User userTrenutni = FirebaseAuth.instance.currentUser;
  var imageToSend2;
  String url;
  var url2;
  final picker = ImagePicker();
  var image;
  var postoji = false;

  Future getImageGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      postoji = true;
      // uploadImage(image);
    } else {
      image =
          'https://i0.wp.com/www.ahpsfivedock.catholic.edu.au/wp-content/uploads/sites/18/2019/05/Person-icon.jpg?ssl=1';
    }
    uploadImage(image);
  }

  Future<void> uploadImage(var imageFile) async {
    await firebase_storage.FirebaseStorage.instance
        .ref('new/photo.jpg')
        .putFile(image);
    imageToSend2 = await firebase_storage.FirebaseStorage.instance
        .ref('new/photo.jpg')
        .getDownloadURL();

    profileImage = imageToSend2;

    notifyListeners();
    // setState(() {
    //   konacniURL = imageToSend2;
    // });
  }

  Future<void> pom() async {
    imageToSend2 = await firebase_storage.FirebaseStorage.instance
        .ref('new/photo.jpg')
        .getDownloadURL();

    profileImage = imageToSend2;
    notifyListeners();
    // setState(() {
    //   konacniURL = imageToSend2;
    // });
  }
}
