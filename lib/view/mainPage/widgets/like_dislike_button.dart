import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_2/providers/post_notifier.dart';
import 'package:facebook_2/viewModel/main_screen_view_model/likes_dislikes_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LikeDislike extends StatefulWidget {
  var document;
  var index;
  var collection;
  var likeOrDislike;
  LikeDislike(
    this.likeOrDislike,
    this.document,
    this.collection,
    this.index,
  );
  @override
  _LikeOrDislikeButtonState createState() => _LikeOrDislikeButtonState();
}

class _LikeOrDislikeButtonState extends State<LikeDislike> {
  @override
  void initState() {
    context.read<PostNotifier>().getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var posts = context.watch<PostNotifier>();

    return OutlinedButton(
      // width: MediaQuery.of(context).size.width * 0.45,
      onPressed: () {
        posts.likeOrDislikeButtonPressed(
            posts.posts[widget.index], widget.index, widget.likeOrDislike);
      },
      child: Row(
        children: [
          widget.likeOrDislike
              ? Icon(
                  Icons.thumb_up,
                  color: getLikedIconModel(widget.document)
                      ? Colors.blue[900]
                      : Colors.grey,
                )
              : Icon(
                  Icons.thumb_down,
                  color: getDislikedIconModel(widget.document)
                      ? Colors.blue[900]
                      : Colors.grey,
                ),
          SizedBox(width: 10),
          Text(widget.likeOrDislike
              ? '${posts.liked.length} likes'
              : '${posts.liked.length} dislikes'),
        ],
      ),
    );
  }
}

// Widget likeDislikeButton(
//     bool likeOrDislike, document, CollectionReference collection, int index) {
//   return OutlinedButton(
//     // width: MediaQuery.of(context).size.width * 0.45,
//     onPressed: () {
//       likeOrDislikePressedModel(document, likeOrDislike);
//     },
//     child: Row(
//       children: [
//         likeOrDislike
//             ? Icon(
//                 Icons.thumb_up,
//                 color: getLikedIconModel(document)
//                     ? Colors.blue[900]
//                     : Colors.grey,
//               )
//             : Icon(
//                 Icons.thumb_down,
//                 color: getDislikedIconModel(document)
//                     ? Colors.blue[900]
//                     : Colors.grey,
//               ),
//         SizedBox(width: 10),
//         Text(likeOrDislike
//             ? '${getLikedLengthModel(document)} likes'
//             : '${getDislikedLengthModel(document)} dislikes'),
//       ],
//     ),
//   );
// }
