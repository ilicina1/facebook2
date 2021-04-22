import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_2/view/mainPage/widgets/comment_button.dart';
import 'package:facebook_2/view/mainPage/widgets/like_dislike_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Widget cardLikesDislakesComment(
    document, BuildContext context, CollectionReference collection, int index) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      likeDislikeButton(true, document, collection, index),
      likeDislikeButton(false, document, collection, index),
      commentButton(context),
    ],
  );
}
