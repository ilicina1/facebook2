import 'package:facebook_2/providers/post_notifier.dart';
import 'package:facebook_2/utils/style/style.dart';
import 'package:facebook_2/view/mainPage/widgets/upload_image.dart';
import 'package:facebook_2/viewModel/main_screen_view_model/upload_post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArrayOfButtonsStat extends StatefulWidget {
  var contexta;
  ArrayOfButtonsStat(this.contexta);
  @override
  _ArrayOfButtonsStatState createState() => _ArrayOfButtonsStatState();
}

class _ArrayOfButtonsStatState extends State<ArrayOfButtonsStat> {
  @override
  void initState() {
    context.read<PostNotifier>().getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var posts = context.watch<PostNotifier>();
    return Row(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            UploadImage(),
            ElevatedButton(
              child: Text(
                'Objavi',
                style: TextStyle(color: Colors.white),
              ),
              style: postButtonSyle(),
              onPressed: () {
                //uredi profil
                posts.uploadPost();
              },
            ),
          ],
        ),
      ],
    );
  }
}
