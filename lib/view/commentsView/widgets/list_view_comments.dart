import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_2/view/commentsView/widgets/card_comments.dart';
import 'package:flutter/material.dart';

class listViewComments extends StatefulWidget {
  var document;
  listViewComments(this.document);
  @override
  _listViewCommentsState createState() => _listViewCommentsState();
}

class _listViewCommentsState extends State<listViewComments> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: ListView.builder(
          itemCount: widget.document['comments'].length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CardComments(widget.document, index),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
