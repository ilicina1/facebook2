import 'package:facebook_2/utils/style/style.dart';
import 'package:facebook_2/viewModel/login_view_model.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        login(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "SignIn",
              style: loginButton,
            ),
          ),
          Icon(
            Icons.login,
            color: Colors.blue[900],
          )
        ],
      ),
    );
  }
}
