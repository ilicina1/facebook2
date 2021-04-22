import 'package:facebook_2/interface/fireStorageInterface.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FireStorageService implements FireStorageInterface {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  @override
  Future<firebase_storage.ListResult> downloadURLExample() {
    return firebase_storage.FirebaseStorage.instance
        .ref('userImages/')
        .listAll();
  }
}
