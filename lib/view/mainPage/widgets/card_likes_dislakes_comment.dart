import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_2/view/mainPage/widgets/comment_button.dart';
import 'package:facebook_2/view/mainPage/widgets/like_dislike_button.dart';
import 'package:flutter/material.dart';

Widget cardLikesDislakesComment(
    document, BuildContext context, collection, int index) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      LikeDislike(true, document, index),
      LikeDislike(false, document, index),
      commentButton(context, document, index),
    ],
  );
}
