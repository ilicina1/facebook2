import 'package:facebook_2/view/mainPage/widgets/comment_button.dart';
import 'package:facebook_2/view/mainPage/widgets/like_dislike_button.dart';
import 'package:flutter/material.dart';

Widget cardLikesDislakesComment() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      likeDislikeButton(true),
      likeDislikeButton(false),
      commentButton(),
    ],
  );
}
