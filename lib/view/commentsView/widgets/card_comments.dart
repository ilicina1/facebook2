import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_2/utils/dummyData/dummyData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

User userTrenutni = FirebaseAuth.instance.currentUser;

void profilePicture() async {
  await FirebaseFirestore.instance
      .collection('users')
      .where('email', isEqualTo: userTrenutni.email)
      .limit(1)
      .get()
      .then((doc) {
    imageProfileComments = doc.docs[0]['profile_picture'];
  });
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
    profilePicture();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 70.0,
          height: 70.0,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
              fit: BoxFit.fill,
              image: new NetworkImage(imageProfileComments),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.45,
          height: 70.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userTrenutni.email,
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              Text(widget.document["comments"][widget.index]),
            ],
          ),
        ),
      ],
    );
  }
}
