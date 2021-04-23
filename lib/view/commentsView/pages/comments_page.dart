import 'package:facebook_2/view/commentsView/widgets/comment_button.dart';
import 'package:facebook_2/view/commentsView/widgets/list_view_comments.dart';
import 'package:facebook_2/view/commentsView/widgets/text_field_comments.dart';
import 'package:facebook_2/view/mainPage/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/list_view_comments.dart';
import '../widgets/list_view_comments.dart';

class CommentsPage extends StatefulWidget {
  var document;
  var index;
  CommentsPage(this.document, this.index);
  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: titleWidget(),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            textFieldComments(),
            CommentButton(widget.document),
            ListViewComments(widget.document, widget.index),
          ],
        ),
      ),
    );
  }
}
