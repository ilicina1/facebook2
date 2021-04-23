import 'package:facebook_2/services/main_screen_services/like_dislike_service.dart';

void likeOrDislikePressedModel(document, likeOrDislike) {
  likeOrDislikeButtonPressed(document, likeOrDislike);
}

bool getLikedIconModel(document) {
  return getLikedIconPressed(document);
}

bool getDislikedIconModel(document) {
  return getDislikedIconPressed(document);
}

int getLikedLengthModel(document) {
  return getLikedLenght(document);
}

int getDislikedLengthModel(document) {
  return getDislikedLenght(document);
}

String getUserTrenutniEmailModel() {
  return getUserTrenutniEmail();
}

List<dynamic> getDislikedArrayModel(document) {
  return getDislikedArrayModel(document);
}

List<dynamic> getLikedArrayModel(document) {
  return getLikedArray(document);
}
