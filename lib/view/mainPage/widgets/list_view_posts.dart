import 'package:facebook_2/view/mainPage/widgets/card_items.dart';
import 'package:flutter/material.dart';

class ListViewPosts extends StatefulWidget {
  @override
  _ListViewPostsState createState() => _ListViewPostsState();
}

class _ListViewPostsState extends State<ListViewPosts> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        // decoration: border,
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.13,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: cardItems(context),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
