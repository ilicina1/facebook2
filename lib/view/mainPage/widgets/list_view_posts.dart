import 'package:facebook_2/providers/post_notifier.dart';
import 'package:facebook_2/services/main_screen_services/add_post.dart';
import 'package:facebook_2/view/mainPage/widgets/card_items.dart';
import 'package:facebook_2/view/mainPage/widgets/card_likes_dislakes_comment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListViewPosts extends StatefulWidget {
  @override
  _ListViewPostsState createState() => _ListViewPostsState();
}

class _ListViewPostsState extends State<ListViewPosts> {
  @override
  void initState() {
    context.read<PostNotifier>().getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var posts = context.watch<PostNotifier>();

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: ListView.builder(
          itemCount: posts.posts.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CardItems(posts.posts[index]),
                    ),
                  ),
                  cardLikesDislakesComment(posts.posts[index], context,
                      getCollectionReference(), index),
                  SizedBox(height: 10),
                ],
              ),
            );
          },
        ),
        // StreamBuilder(
        //   stream: FirebaseFirestore.instance.collection("posts").snapshots(),
        //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        //     if (!snapshot.hasData) {
        //       return Center(child: CircularProgressIndicator());
        //     }
        //     // return ListView.builder(
        //     //   itemCount: snapshot.data.docs.length,
        //     //   itemBuilder: (BuildContext context, int index) {
        //     //     return Container(
        //     //       child: Column(
        //     //         children: [
        //     //           Card(
        //     //             child: Padding(
        //     //               padding: const EdgeInsets.all(10.0),
        //     //               child: CardItems(snapshot.data.docs[index]),
        //     //             ),
        //     //           ),
        //     //           cardLikesDislakesComment(snapshot.data.docs[index],
        //     //               context, getCollectionReference(), index),
        //     //           SizedBox(height: 10),
        //     //         ],
        //     //       ),
        //     //     );
        //     //   },
        //     // );
        //   },
        // ),
      ),
    );
  }
}
