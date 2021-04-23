import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_2/viewModel/main_screen_view_model/likes_dislikes_view_model.dart';
import 'package:flutter/material.dart';

Widget likeDislikeButton(
    bool likeOrDislike, document, CollectionReference collection, int index) {
  return OutlinedButton(
    // width: MediaQuery.of(context).size.width * 0.45,
    onPressed: () {
      likeOrDislikePressedModel(document, likeOrDislike);
    },
    child: Row(
      children: [
        likeOrDislike
            ? Icon(
                Icons.thumb_up,
                color: getLikedIconModel(document)
                    ? Colors.blue[900]
                    : Colors.grey,
              )
            : Icon(
                Icons.thumb_down,
                color: getDislikedIconModel(document)
                    ? Colors.blue[900]
                    : Colors.grey,
              ),
        SizedBox(width: 10),
        Text(likeOrDislike
            ? '${getLikedLengthModel(document)} likes'
            : '${getDislikedLengthModel(document)} dislikes'),
      ],
    ),
  );
}
