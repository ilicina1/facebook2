import 'package:facebook_2/services/login_screen_services/login_facebook.dart';

import '../services/login_facebook.dart';

void login(context) {
<<<<<<< HEAD
  LoginFacebookService().initiateFacebookLogin(context);
}

void logout(context) {
  LoginFacebookService().logOut(context);
=======
  handleLogin(context);
}

void logout(context) {
  googleSignout(context);
>>>>>>> main
}
