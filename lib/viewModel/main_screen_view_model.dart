import 'package:facebook_2/services/login_screen_services/login_facebook.dart';
import 'package:facebook_2/services/main_screen_services/add_post.dart';
import 'package:facebook_2/services/main_screen_services/upload_file.dart';

void addPostModel(name, image, postText, mail) {
  addPost(name, image, postText, mail);
}

void uploadPostModel() {
  uploadPost();
}

void googleSignOut(context) {
  googleSignout(context);
}
