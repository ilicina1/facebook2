import 'package:facebook_2/view/gallery/pages/photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

Widget galleryGrid(images) {
  print(images.length);
  return StaggeredGridView.countBuilder(
    crossAxisCount: 4,
    itemCount: images.length,
    itemBuilder: (BuildContext context, int index) => Container(
      
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10)
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  ),
      child: Container(
        child: InkWell(
           onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Photo(image :images[index])));
    },
          child: Image.network(images[index],),
        ),
      )
    ),
    staggeredTileBuilder: (int index) =>
        StaggeredTile.count(2, index.isEven ? 2 : 1),
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
  );
}
