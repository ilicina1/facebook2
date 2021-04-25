import 'package:facebook_2/providers/comment_notifier.dart';
import 'package:flutter/material.dart';
import 'package:facebook_2/utils/style/style.dart';
import 'package:provider/provider.dart';
import 'package:facebook_2/view/commentsView/widgets/text_field_comments.dart';

class CommentButton extends StatefulWidget {
  var document;
  CommentButton(this.document);
  @override
  _CommentButtonState createState() => _CommentButtonState();
}

class _CommentButtonState extends State<CommentButton> {
  @override
  void initState() {
    context.read<CommentNotifier>().getComments(widget.document);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var notif = context.watch<CommentNotifier>();
    return TextButton(
      child: Text(
        'Komentariši',
        style: TextStyle(color: Colors.white),
      ),
      style: postButtonSyle(),
      onPressed: () {
        notif.addComment(myControllerComments, widget.document);
      },
    );
  }
}
