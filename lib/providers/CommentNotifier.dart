import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:facebook_2/view/commentsView/widgets/text_field_comments.dart';

class CommentNotifier extends ChangeNotifier {
  List<dynamic> _comments = [];
  List<dynamic> get comments => _comments;

  Future<void> getComments(document) async {
    List<dynamic> listComments = [];

    await FirebaseFirestore.instance
        .collection('posts')
        .get()
        .then((querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                if (doc.id == document.id) {
                  listComments = doc['comments'];
                }
                _comments = listComments;
              })
            });
    _comments = listComments;
    notifyListeners();
  }

  void addComment(commentToAdd, document) {
    FirebaseFirestore.instance.collection("posts").doc(document.id).update({
      "comments": FieldValue.arrayUnion([myControllerComments.text])
    });

    myControllerComments.clear();
    _comments.add(commentToAdd);

    notifyListeners();
  }
}
