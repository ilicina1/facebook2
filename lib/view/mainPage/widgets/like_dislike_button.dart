import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_2/services/main_screen_services/like_dislike_service.dart';
import 'package:flutter/material.dart';

Widget likeDislikeButton(
    bool likeOrDislike, document, CollectionReference collection, int index) {
  return OutlinedButton(
    // width: MediaQuery.of(context).size.width * 0.45,
    onPressed: () {
      likeOrDislikeButtonPressed(document, likeOrDislike);
    },
    child: Row(
      children: [
        likeOrDislike
            ? Icon(
                Icons.thumb_up,
                color: getLikedIconPressed(document)
                    ? Colors.blue[900]
                    : Colors.grey,
              )
            : Icon(
                Icons.thumb_down,
                color: getDislikedIconPressed(document)
                    ? Colors.blue[900]
                    : Colors.grey,
              ),
        SizedBox(width: 10),
        Text(likeOrDislike
            ? '${getLikedLenght(document)} likes'
            : '${getDislikedLenght(document)} dislikes'),
      ],
    ),
  );
}
