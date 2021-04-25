import 'package:facebook_2/providers/post_image_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadImage extends StatefulWidget {
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  @override
  Widget build(BuildContext context) {
    var notif = context.watch<PostImageNotifier>();

    return Row(
      children: [
        TextButton(
          onPressed: notif.getImageCam,
          child: Icon(
            Icons.add_a_photo,
            color: Colors.blue[900],
          ),
        ),
        TextButton(
          onPressed: notif.getImageGallery,
          child: Icon(
            Icons.photo_album,
            color: Colors.blue[900],
          ),
        )
      ],
    );
  }
}
