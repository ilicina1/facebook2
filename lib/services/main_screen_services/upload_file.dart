import 'package:facebook_2/services/login_screen_services/login_facebook.dart';
import 'package:facebook_2/services/main_screen_services/add_post.dart';
import 'package:facebook_2/utils/dummyData/dummyData.dart';
import 'package:facebook_2/view/mainPage/widgets/text_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

Future uploadPost() async {
  // inicijalizacija
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  // splitamo image path da bi dobili njegov naziv
  List<String> imageName = [];
  if (image != null) imageName = image.path.split('/');

  // za svakog usera koji postavi nesto spasavamo sliku u posts/njegovUserId/nazivSlike
  try {
    if (image != null) {
      await firebase_storage.FirebaseStorage.instance
          .ref('posts/${user.email}/${imageName[imageName.length - 1]}')
          .putFile(image);
    }
  } catch (e) {
    print("Fail firebase storage");
  }

  if (image != null) {
    addPost(user.displayName, imageName[imageName.length - 1],
        myController.text, user.email);
  } else {
    addPost(user.displayName, "", myController.text, user.email);
  }

  // firebase_storage.ListResult result =
  //     await firebase_storage.FirebaseStorage.instance.ref('posts').listAll();

  // result.items.forEach((firebase_storage.Reference ref) {
  //   print('Found file: $ref ');
  // });
}
