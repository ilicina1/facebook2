import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Widget likeDislikeButton(
    bool likeOrDislike, document, CollectionReference collection, int index) {
  return OutlinedButton(
    // width: MediaQuery.of(context).size.width * 0.45,
    onPressed: () {
      //document['likes'] = 10;
      //FirebaseFirestore.instance.collection("posts").doc(document).set({'likes': 20});
      collection.doc('$index').set({
        'created': document['created'],
        'dislikes': document['dislikes'],
        'image': document['image'],
        'likes': 487,
        'name': document['name'],
        'postText': document['postText'],
        'userMail': document['userMail'],
      });

      //Firestore.instance.document('Users/$uid');
    },
    child: Row(
      children: [
        Icon(
          likeOrDislike ? Icons.thumb_up : Icons.thumb_down,
          color: Colors.grey,
        ),
        SizedBox(width: 10),
        Text(likeOrDislike
            ? '${document['likes']} likes'
            : '${document['dislikes']} dislikes'),
      ],
    ),
  );
}
