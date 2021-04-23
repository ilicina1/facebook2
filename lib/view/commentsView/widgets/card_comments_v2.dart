import 'package:facebook_2/utils/dummyData/dummyData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

User userTrenutni = FirebaseAuth.instance.currentUser;

Widget cardCommentsV2(context, document, index) {
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
            Text(document["comments"][index]),
          ],
        ),
      ),
    ],
  );
}
