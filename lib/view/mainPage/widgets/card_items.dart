import 'package:flutter/material.dart';

Widget cardItems(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: 70.0,
        height: 70.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
            fit: BoxFit.fill,
            image: new NetworkImage("https://i.imgur.com/BoN9kdC.png"),
          ),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: 70.0,
        child: Text(
            "Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor"),
      ),
      Container(
        // width: MediaQuery.of(context).size.width * 0.45,
        height: 70.0,
        child: Column(
          children: [
            TextButton(
              onPressed: () => {},
              child: Icon(
                Icons.thumb_up,
                color: Colors.blue[900],
              ),
            ),
            Text("4 likes"),
          ],
        ),
      ),
    ],
  );
}
