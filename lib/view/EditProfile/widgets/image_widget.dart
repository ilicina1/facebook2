import 'package:facebook_2/providers/profile_image_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageWidget2 extends StatefulWidget {
  ImageWidget2(BuildContext context);

  @override
  _ImageWidget2State createState() => _ImageWidget2State();
}

class _ImageWidget2State extends State<ImageWidget2> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var notif = context.watch<ProfileImageNotifier>();

    notif.pom();
  }

  @override
  Widget build(BuildContext context) {
    var notif = context.watch<ProfileImageNotifier>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: GestureDetector(
            onTap: () async {
              await notif.getImageGallery();
            },
            child: CircleAvatar(
              backgroundImage: notif.profileImage != null
                  ? NetworkImage('${notif.profileImage}')
                  : NetworkImage(
                      'https://i0.wp.com/www.ahpsfivedock.catholic.edu.au/wp-content/uploads/sites/18/2019/05/Person-icon.jpg?ssl=1'),
              radius: 80.0,
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
