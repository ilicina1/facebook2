import 'package:facebook_2/utils/dummyData/dummyData.dart';
import 'package:facebook_2/view/mainPage/widgets/card_items.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class ListViewPosts extends StatefulWidget {
  @override
  _ListViewPostsState createState() => _ListViewPostsState();
}

Future<void> storageLen() async {
  firebase_storage.ListResult result =
      await firebase_storage.FirebaseStorage.instance.ref('posts/').listAll();
  storageLength = result.items.length;
}

// Future<void> storageResult() async {
//   result =
//       await firebase_storage.FirebaseStorage.instance.ref('posts/').listAll();
// }

class _ListViewPostsState extends State<ListViewPosts> {
  @override
  Widget build(BuildContext context) {
    // storageResult();
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("posts").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.13,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: cardItems(context, snapshot.data.docs[index]),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
