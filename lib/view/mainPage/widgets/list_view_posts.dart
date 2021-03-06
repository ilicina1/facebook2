import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_2/services/main_screen_services/add_post.dart';
import 'package:facebook_2/view/mainPage/widgets/card_items.dart';
import 'package:facebook_2/view/mainPage/widgets/card_likes_dislakes_comment.dart';
import 'package:flutter/material.dart';

class ListViewPosts extends StatefulWidget {
  @override
  _ListViewPostsState createState() => _ListViewPostsState();
}

class _ListViewPostsState extends State<ListViewPosts> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("posts").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CardItems(snapshot.data.docs[index]),
                        ),
                      ),
                      cardLikesDislakesComment(snapshot.data.docs[index],
                          context, getCollectionReference(), index),
                      SizedBox(height: 10),
                    ],
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
