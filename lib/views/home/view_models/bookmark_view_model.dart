import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';

class BookMarkViewmodel extends ChangeNotifier {
  List<Article> bookmark = [];
  addToBookmark(Article article) {
    bookmark.add(article);
    notifyListeners();
  }

  removeFromBookmark(Article article) {
    bookmark.remove(article);

    // bookmark.removeWhere((other) => article == other
    //     // other.image == article.image &&
    //     // other.content == article.content &&
    //     // other.publishedAt == article.publishedAt &&
    //     // other.title == article.title &&
    //     // other.source == article.source

    //     );
    notifyListeners();
  }
}
