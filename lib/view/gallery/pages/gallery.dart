import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_2/services/gallery_services/galleryService.dart';
import 'package:facebook_2/view/gallery/widgets/grid.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');

    return (FutureBuilder(
      future: posts.get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          List images = [];

          snapshot.data.docs.forEach((element) {
            images.add(element['image']);
          });
          return Scaffold(
      backgroundColor: Colors.white,

            body: galleryGrid(images),
          );
        } else if (snapshot.hasError) {
          print('error');
        }
        return Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text('loading')]),
        );
      },
    ));
  }
}
