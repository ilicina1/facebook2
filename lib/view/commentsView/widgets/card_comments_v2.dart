import 'package:facebook_2/providers/profile_image_notifier.dart';
import 'package:facebook_2/utils/dummyData/dummyData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:facebook_2/providers/comment_notifier.dart';
import 'package:provider/provider.dart';

User userTrenutni = FirebaseAuth.instance.currentUser;

class CardCommentsV2 extends StatefulWidget {
  var document;
  var index;
  var imgProfCom;
  CardCommentsV2(this.document, this.index, this.imgProfCom);
  @override
  _CardCommentsV2State createState() => _CardCommentsV2State();
}

class _CardCommentsV2State extends State<CardCommentsV2> {
  @override
  Widget build(BuildContext context) {
    var notif = context.watch<CommentNotifier>();
    var notif2 = context.watch<ProfileImageNotifier>();
    if (notif2.profileImage != null) widget.imgProfCom = notif2.profileImage;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 70.0,
          height: 70.0,
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
              fit: BoxFit.fill,
              image: new NetworkImage(widget.imgProfCom),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.45,
          height: 70.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userTrenutni.email,
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              FutureBuilder(
                future: notif.getComment(widget.document, widget.index),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    return Text(snapshot.data);
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
