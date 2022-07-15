import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/services/article_service.dart';

class CategoryViewModel extends ChangeNotifier {
  final ArticleService _articleService = ArticleService();
  final String category;
  List<Article> articles = [];

  CategoryViewModel(this.category) {
    getArticles();
  }

  getArticles() async {
    articles = await _articleService.getArticlesByCategory(category);
    notifyListeners();
  }
}
