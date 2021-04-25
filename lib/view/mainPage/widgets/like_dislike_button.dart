import 'package:facebook_2/providers/post_notifier.dart';
import 'package:facebook_2/services/main_screen_services/like_dislike_service.dart';
import 'package:facebook_2/viewModel/main_screen_view_model/likes_dislikes_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LikeDislike extends StatefulWidget {
  var document;
  var index;
  var likeOrDislike;
  LikeDislike(
    this.likeOrDislike,
    this.document,
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
    return OutlinedButton(
      onPressed: () {
        likeOrDislikeButtonPressed(widget.document, widget.likeOrDislike);
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
              ? '${getLikedLengthModel(widget.document)} likes'
              : '${getDislikedLengthModel(widget.document)} dislikes'),
        ],
      ),
    );
  }
}
