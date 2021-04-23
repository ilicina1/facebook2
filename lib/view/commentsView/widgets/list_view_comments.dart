import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_2/providers/CommentNotifier.dart';
import 'package:facebook_2/view/commentsView/widgets/card_comments.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListViewComments extends StatefulWidget {
  var document;
  var indexCheck;
  ListViewComments(this.document, this.indexCheck);
  @override
  _ListViewCommentsState createState() => _ListViewCommentsState();
}

class _ListViewCommentsState extends State<ListViewComments> {
  var duzina = 0;
  @override
  void initState() {
    context.read<CommentNotifier>().getComments(widget.document);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var notif = context.watch<CommentNotifier>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: ListView.builder(
          itemCount: notif.comments.length,
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

        //     StreamBuilder(
        //   stream: FirebaseFirestore.instance.collection("posts").snapshots(),
        //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        //     if (!snapshot.hasData) {
        //       return Center(child: CircularProgressIndicator());
        //     }
        //     if (snapshot.data.docs[widget.indexCheck].id ==
        //         widget.document.id) {
        //       return ListView.builder(
        //         itemCount:
        //             snapshot.data.docs[widget.indexCheck]['comments'].length,
        //         itemBuilder: (BuildContext context, int index) {
        //           return Container(
        //             child: Column(
        //               children: [
        //                 Card(
        //                   child: Padding(
        //                     padding: const EdgeInsets.all(10.0),
        //                     child: CardComments(widget.document, index),
        //                   ),
        //                 ),
        //                 SizedBox(height: 10),
        //               ],
        //             ),
        //           );
        //         },
        //       );
        //     }
        //   },
        // ),
      ),
    );
  }
}
