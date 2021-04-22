import 'package:facebook_2/utils/style/postButtonStyle.dart';
import 'package:facebook_2/viewModel/comments_view_model.dart';
import 'package:flutter/material.dart';

Widget commentButton(document) {
  return ElevatedButton(
    child: Text(
      'Komentariši',
      style: TextStyle(color: Colors.white),
    ),
    style: postButtonSyle(),
    onPressed: () {
      addCommentModel(document);
    },
  );
}
