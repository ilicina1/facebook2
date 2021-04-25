import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_2/interface/gallery_interface.dart';

class GalleryService implements GalleryInterface {
  CollectionReference posts = FirebaseFirestore.instance.collection('posts');

  @override
  Future<QuerySnapshot> downloadURLExample() async {
    QuerySnapshot data = await posts.get();
    return data;
  }
}
