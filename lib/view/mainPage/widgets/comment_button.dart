import 'package:facebook_2/view/commentsView/pages/comments_page.dart';
import 'package:flutter/material.dart';

Widget commentButton(BuildContext context, document, index) {
  return OutlinedButton(
    // width: MediaQuery.of(context).size.width * 0.45,
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CommentsPage(document, index)),
      );
    },
    child: Text('Comments'),
  );
}
