import 'package:facebook_2/services/fireStorageService.dart';
import 'package:facebook_2/view/gallery/widgets/grid.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Gallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var inst = FirebaseStorage.instance;
    print(inst);

    return (FutureBuilder(
      future: FireStorageService().downloadURLExample(),
      builder: (BuildContext context, AsyncSnapshot<ListResult> snapshot) {
        if (snapshot.hasData) {
          print(snapshot);
        } else if (snapshot.hasError) {
          print('error');
        } else {
          print('loadingg');
        }
        return Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text('d')]),
        );
      },
    ));
  }
}
