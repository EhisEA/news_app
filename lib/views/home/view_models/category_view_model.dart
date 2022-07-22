import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/services/article_service.dart';

class CategoryViewModel extends ChangeNotifier {
  final ArticleService _articleService = ArticleService();
  final String category;
  List<Article> articles = [];
  int page = 1;
  bool isLoading = false;
  static const int pageLimit = 20;

  CategoryViewModel(this.category) {
    getArticles();
  }

  Future<void> getArticles() async {
    isLoading = true;
    notifyListeners();
    articles = await _articleService.getArticlesByCategory(category);

    isLoading = false;
    notifyListeners();
  }

  getMore() async {
    if (!isLoading) {
      isLoading = true;
      notifyListeners();
      //get more articl and add it to the current list
      articles.addAll(
        await _articleService.getArticlesByCategory(category,
            pageSize: pageLimit, page: page),
      );
      //increase page to set current page
      ++page;
      //notify state
      isLoading = false;
      notifyListeners();
    }
  }
}
