import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_2/view/editProfile/widgets/image_widget.dart';
import 'package:facebook_2/view/editProfile/widgets/text_fields.dart';
import 'package:flutter/material.dart';

class ProfileEditables extends StatefulWidget {
  final doc;
  ProfileEditables(BuildContext context, DocumentSnapshot this.doc);

  @override
  _ProfileEditablesState createState() => _ProfileEditablesState();
}

class _ProfileEditablesState extends State<ProfileEditables> {
  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        imageWidget(context, widget.doc),
        SizedBox(
          height: 10,
        ),
        Icon(
          Icons.add_a_photo,
          size: 35,
        ),
        textFields(context),
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Icon(
                  Icons.photo_album,
                  size: 80,
                  color: Colors.blue,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Upravljajte \n slikama',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.grey,
                      letterSpacing: 1.5,
                      fontSize: 14),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.video_library,
                  size: 80,
                  color: Colors.red,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Upravljajte \n videozapisima',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.grey,
                      letterSpacing: 1.5,
                      fontSize: 14),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
