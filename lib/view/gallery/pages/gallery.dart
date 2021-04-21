import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_2/view/gallery/widgets/grid.dart';
import 'package:flutter/material.dart';

class Gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (StreamBuilder(
      stream: FirebaseFirestore.instance.collection('meals').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
        return grid(images : snapshot.data);
      },
    ));
  }
}
