import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget imageWidget(BuildContext context, DocumentSnapshot doc) {
  String image = doc['image'].toString();
  return Row(
    //crossAxisAlignment: CrossAxisAlignment.baseline,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/$image'),
          radius: 80.0,
          backgroundColor: Colors.white,
        ),
      ),
    ],
  );
}
