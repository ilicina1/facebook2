import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_2/services/login_screen_services/login_facebook.dart';
import 'package:facebook_2/services/main_screen_services/like_dislike_service.dart';
import 'package:facebook_2/utils/dummyData/dummyData.dart';
import 'package:facebook_2/view/mainPage/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class PostNotifier extends ChangeNotifier {
  List<dynamic> _posts = [];
  List<dynamic> get posts => _posts;
  List<dynamic> _liked = [];
  List<dynamic> _disliked = [];
  List<dynamic> get liked => _liked;
  List<dynamic> get disliked => _disliked;
  var post;

  Future<void> getPosts() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("posts").get();

    _posts = querySnapshot.docs;

    notifyListeners();
  }

  Future<void> getPost(index) async {
    post = _posts[index];

    notifyListeners();
  }

  Future<void> addPost(
    name,
    imageToSend,
    postText,
    mail,
  ) async {
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');
    await posts
        .add({
          'name': name,
          'created': Timestamp.now(),
          'image': imageToSend,
          'postText': postText,
          'userMail': mail,
          'comments': [],
          'liked': [],
          'disliked': [],
        })
        .then((value) => print("Post added"))
        .catchError((error) => print("Failed to add post: $error"));

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("posts").get();

    _posts = querySnapshot.docs;
    print(_posts.length);
    notifyListeners();
  }

  Future uploadPost() async {
    // inicijalizacija
    var imageToSend;

    // splitamo image path da bi dobili njegov naziv
    List<String> imageName = [];
    if (image != null) imageName = image.path.split('/');

    // za svakog usera koji postavi nesto spasavamo sliku u posts/njegovUserId/nazivSlike
    try {
      if (image != null) {
        await firebase_storage.FirebaseStorage.instance
            .ref('posts/${imageName[imageName.length - 1]}')
            .putFile(image);
        imageToSend = await firebase_storage.FirebaseStorage.instance
            .ref('posts/${imageName[imageName.length - 1]}')
            .getDownloadURL();
      }
    } catch (e) {
      print("Fail firebase storage");
    }

    if (image != null) {
      addPost(user.displayName, imageToSend, myController.text, user.email);
    } else {
      addPost(user.displayName, "", myController.text, user.email);
    }

    myController.clear();

    notifyListeners();
  }
}
