import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/services/article_service.dart';

class HomeViewModel extends ChangeNotifier {
  final ArticleService articleService = ArticleService();
  List<Article> topHeadlines = [];

  getTopHeadlines() async {
    topHeadlines = await articleService.getTopArticles();
    notifyListeners();
  }
}
