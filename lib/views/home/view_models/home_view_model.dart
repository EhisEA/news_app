import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/services/article_service.dart';

class HomeViewModel extends ChangeNotifier {
  final ArticleService _articleService = ArticleService();
  List<Article> topHeadlines = [];
  // HomeViewModel() {
  //   getTopHeadlines();
  // }

  getTopHeadlines() async {
    topHeadlines = await _articleService.getTopArticles();
    notifyListeners();
  }
}
