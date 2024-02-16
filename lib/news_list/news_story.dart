import 'dart:typed_data';

import 'package:flutter/material.dart';

class NewsStory extends StatelessWidget {
  final String itemTitle;
  final String itemImage;
  final String itemBody;
  final String itemAuthor;
  final DateTime itemDate;
  late Image img;

  NewsStory(this.itemTitle, this.itemImage, this.itemBody, this.itemAuthor, this.itemDate);

  @override
  Widget build(BuildContext context) {
    var date = "${itemDate.day}-${itemDate.month}-${itemDate.year}";
    var img = Image.network(itemImage);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      color: Colors.purpleAccent,
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            itemTitle,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black,
                decoration: TextDecoration.none),
          ),
          Text(
            "By $itemAuthor on $date",
            style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                decoration: TextDecoration.none),
          ),
          const Divider(),
          Expanded(child: Image.network(itemImage, fit: BoxFit.fitWidth)),
          const Divider(),
          Text(
            itemBody,
            style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                decoration: TextDecoration.none),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go back!'),
              ),
            ],
          ),
    );
  }
}