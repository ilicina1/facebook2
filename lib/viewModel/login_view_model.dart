import 'package:facebook_2/services/login_facebook.dart';

import '../services/login_facebook.dart';

void login(context) {
  LoginFacebookService().initiateFacebookLogin(context);
}

void logout(context) {
  LoginFacebookService().logOut(context);
}
