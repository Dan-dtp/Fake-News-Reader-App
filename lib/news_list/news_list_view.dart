import 'package:a1_fakenews/news/model/model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'news_story.dart';


class NewsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    const title = 'Fake News Reader';
    List<NewsItem> newsItem = NewsDatabase().getNewsItems();
    return MaterialApp(
      title: title,
      home: Scaffold(
            appBar: AppBar(
              title: const Text(title),
            ),
            body: Container(
              color: Colors.purpleAccent,
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: newsItem.length,
                itemBuilder: (context, index) {
                  final item = newsItem[index];
                  final text = item.getBody();
                  return Container(
                    color: Colors.white,
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      title: Text(item.getTitle()),
                      leading: Image.network(item.getImage()),
                      subtitle: Text('${text.substring(0, 100)}...'),
                      onTap: () {
                        var snackBar =
                            SnackBar(content: Text("Tapped on $title"));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsStory(
                                  item.getTitle(),
                                  item.getImage(),
                                  item.getBody(),
                                  item.getAuthor(),
                                  item.getDate()),
                            ));
                      },
                    ),
                  );
                },
              ),
            )));
        }
      }
