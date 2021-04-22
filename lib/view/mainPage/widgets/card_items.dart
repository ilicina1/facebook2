import 'package:facebook_2/utils/dummyData/dummyData.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class CardItems extends StatefulWidget {
  var document;
  CardItems(this.document);
  @override
  _CardItemsState createState() => _CardItemsState();
}

class _CardItemsState extends State<CardItems> {
  @override
  Widget build(BuildContext context) {
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
              image: new NetworkImage(widget.document["image"]),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.45,
          height: 70.0,
          child: Text(widget.document["postText"]),
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
}

// Widget cardItems(context) {
//   print("$imgUrlDownload ABA");
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       Container(
//         width: 70.0,
//         height: 70.0,
//         decoration: new BoxDecoration(
//           shape: BoxShape.circle,
//           image: new DecorationImage(
//             fit: BoxFit.fill,
//             image: new NetworkImage(imgUrlDownload),
//           ),
//         ),
//       ),
//       Container(
//         width: MediaQuery.of(context).size.width * 0.45,
//         height: 70.0,
//         child: Text(
//             "Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor"),
//       ),
//       Container(
//         // width: MediaQuery.of(context).size.width * 0.45,
//         height: 70.0,
//         child: Column(
//           children: [
//             TextButton(
//               onPressed: () => {},
//               child: Icon(
//                 Icons.thumb_up,
//                 color: Colors.blue[900],
//               ),
//             ),
//             Text("4 likes"),
//           ],
//         ),
//       ),
//     ],
//   );
// }
