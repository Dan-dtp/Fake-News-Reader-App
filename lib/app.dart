import 'package:flutter/material.dart';

import 'news_list/news_list_page.dart';

class FakeNewsApp extends MaterialApp {
  FakeNewsApp({Key? key})
      : super(
          key: key,
          title: 'Fake News Reader',
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          home: const NewsPage(),
        );
}
