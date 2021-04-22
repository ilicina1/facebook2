import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final Future<FirebaseApp> _initialization = Firebase.initializeApp();

Future<void> addPost(name, imageToSend, postText, mail) {
  CollectionReference posts = FirebaseFirestore.instance.collection('posts');
  return posts
      .add({
        'name': name,
        'created': Timestamp.now(),
        'image': imageToSend,
        'postText': postText,
        'userMail': mail,
        'likes': 0,
        'dislikes': 0,
      })
      .then((value) => print("Post added"))
      .catchError((error) => print("Failed to add post: $error"));
}

CollectionReference getCollectionReference() {
  return FirebaseFirestore.instance.collection("posts");
}
