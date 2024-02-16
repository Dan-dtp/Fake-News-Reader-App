// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:math';

import 'package:a1_fakenews/news/model/news_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:a1_fakenews/main.dart';

void main() {
  group('NewsItem', () {
    String title = "Trump is in jail";
    String body = "Trump has been convicted of multiple crimes";
    String author = "Daily Mail";
    DateTime date = DateTime.now();
    String image = "data:image/jpeg;base64,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";
    bool isRead = true;

    late NewsItem newsItem;

    setUp(() {
      newsItem = NewsItem(title, body, author, date, image, isRead);
    });

    test('test NewsItem constructor created newsItem successfully', () {
      expect(newsItem, newsItem);
    });

    test('test readVersion returns copy of NewsItem', () {
      expect(newsItem.readVersion(), newsItem);
    });

    test('test == operator compares properly', () {
      expect(
          newsItem == NewsItem(title, body, author, date, image, isRead), true);
    });

    test('test get hashcode function works properly', () {
      expect(
          newsItem.hashCode ==
              NewsItem(title, body, author, date, image, isRead).hashCode,
          true);
    });

    test('test getTitle returns title', () {
      expect(newsItem.getTitle(), title);
    });

    test('test getBody returns body', () {
      expect(newsItem.getBody(), body);
    });

    test('test getAuthor returns author', () {
      expect(newsItem.getAuthor(), author);
    });

    test('test getDate returns date', () {
      expect(newsItem.getDate(), date);
    });
  });
}