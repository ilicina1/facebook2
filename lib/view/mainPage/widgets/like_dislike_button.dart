import 'package:flutter/material.dart';

Widget likeDislikeButton(bool likeOrDislike) {
  return OutlinedButton(
    // width: MediaQuery.of(context).size.width * 0.45,
    onPressed: () {},
    child: Row(
      children: [
        Icon(
          likeOrDislike ? Icons.thumb_up : Icons.thumb_down,
          color: Colors.grey,
        ),
        SizedBox(width: 10),
        Text("4 likes"),
      ],
    ),
  );
}
