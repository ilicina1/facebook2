import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_2/utils/dummyData/dummyData.dart';
import 'package:facebook_2/view/commentsView/widgets/card_comments_v2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

User userTrenutni = FirebaseAuth.instance.currentUser;

Future<String> profilePicture() async {
  await FirebaseFirestore.instance
      .collection('users')
      .where('email', isEqualTo: userTrenutni.email)
      .limit(1)
      .get()
      .then((doc) {
    imageProfileComments = doc.docs[0]['profile_picture'];
  });
  return imageProfileComments;
}

class CardComments extends StatefulWidget {
  var document;
  var index;
  CardComments(this.document, this.index);
  @override
  _CardCommentsState createState() => _CardCommentsState();
}

class _CardCommentsState extends State<CardComments> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: profilePicture(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return cardCommentsV2(context, widget.document, widget.index);
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
