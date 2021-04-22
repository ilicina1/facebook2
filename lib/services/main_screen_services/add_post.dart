import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final Future<FirebaseApp> _initialization = Firebase.initializeApp();
CollectionReference posts = FirebaseFirestore.instance.collection('posts');

Future<void> addPost(name, image, postText, mail) {
  return posts
      .add({
        'name': name,
        'created': Timestamp.now(),
        'image': image,
        'postText': postText,
        'userMail': mail,
      })
      .then((value) => print("Post added"))
      .catchError((error) => print("Failed to add post: $error"));
}
