import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/services/article_service.dart';

class HomeViewModel extends ChangeNotifier {
  final ArticleService _articleService = ArticleService();
  List<Article> topHeadlines = [];
  List<Article> bookmark = [];

  getTopHeadlines() async {
    topHeadlines = await _articleService.getTopArticles();
    notifyListeners();
  }

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
