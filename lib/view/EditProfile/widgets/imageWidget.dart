import 'package:flutter/material.dart';

Widget imageWidget(BuildContext context) {
  return Row(
    //crossAxisAlignment: CrossAxisAlignment.baseline,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://i0.wp.com/www.ahpsfivedock.catholic.edu.au/wp-content/uploads/sites/18/2019/05/Person-icon.jpg?ssl=1'),
          radius: 80.0,
          backgroundColor: Colors.white,
        ),
      ),
    ],
  );
}
