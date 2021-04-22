import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

List<dynamic> getLikedArray(document) {
  List<dynamic> likedArray = document['liked'];
  return likedArray;
}

List<dynamic> getDislikedArray(document) {
  List<dynamic> dislikedArray = document['disliked'];
  return dislikedArray;
}

String getUserTrenutniEmail() {
  User userTrenutni = FirebaseAuth.instance.currentUser;
  //return userTrenutni.email;
  //****************NAPOMENA************** */
  //stavljeno je u return da vraca string neki bezveze
  //zato jer je testirano bez da je korisnik prijavljen
  //(u main-u direktno se ide na MainScreen - bez facebook logina)
  //a inace treba koristiti --> return userTrenutni.email;
  ////****************NAPOMENA************** */
  return "moj@stopostomail.com";
}

void likeOrDislikeButtonPressed(document, bool likeOrDislike) {
  List<dynamic> likedArray = getLikedArray(document);
  List<dynamic> dislikedArray = getDislikedArray(document);
  String userTrenutniEmail = getUserTrenutniEmail();

  if (likeOrDislike) {
    if (dislikedArray.contains('$userTrenutniEmail')) {
      dislikedArray.remove('$userTrenutniEmail');
      likedArray.add('$userTrenutniEmail');
    } else if (likedArray.contains('$userTrenutniEmail')) {
      likedArray.remove('$userTrenutniEmail');
    } else {
      likedArray.add('$userTrenutniEmail');
    }
  } else {
    if (dislikedArray.contains('$userTrenutniEmail')) {
      dislikedArray.remove('$userTrenutniEmail');
    } else if (likedArray.contains('$userTrenutniEmail')) {
      likedArray.remove('$userTrenutniEmail');
      dislikedArray.add('$userTrenutniEmail');
    } else {
      dislikedArray.add('$userTrenutniEmail');
    }
  }

  FirebaseFirestore.instance.collection("posts").doc(document.id).update({
    'liked': likedArray,
    'disliked': dislikedArray,
  });
}

bool getLikedIconPressed(document) {
  if (getLikedArray(document).contains('${getUserTrenutniEmail()}'))
    return true;
  return false;
}

bool getDislikedIconPressed(document) {
  if (getDislikedArray(document).contains('${getUserTrenutniEmail()}'))
    return true;
  return false;
}

int getLikedLenght(document) {
  List<dynamic> likedArray = getLikedArray(document);
  return likedArray.length;
}

int getDislikedLenght(document) {
  List<dynamic> dislikedArray = getDislikedArray(document);
  return dislikedArray.length;
}
