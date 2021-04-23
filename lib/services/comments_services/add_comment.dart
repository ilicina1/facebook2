import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_2/view/commentsView/widgets/text_field_comments.dart';

void addComment(document) async {
  FirebaseFirestore.instance.collection("posts").doc(document.id).update({
    "comments": FieldValue.arrayUnion([myControllerComments.text])
  });

  myControllerComments.clear();
}
