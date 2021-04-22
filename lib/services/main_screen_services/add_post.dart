import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final Future<FirebaseApp> _initialization = Firebase.initializeApp();

Future<void> addPost(name, image, postText, mail) {
  CollectionReference posts = FirebaseFirestore.instance.collection('posts');
  //print('PPPPPPPPPPPPPOOOOOOOOOOOOSSSSSSSSTTTTT $brojPostova');

  return posts.doc().set({
    'name': name,
    'created': Timestamp.now(),
    'image': image,
    'postText': postText,
    'userMail': mail,
  }).then((value) => print("Post added"));
}

CollectionReference getCollectionReference() {
  return FirebaseFirestore.instance.collection("posts");
}
