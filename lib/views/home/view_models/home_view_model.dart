import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/services/article_service.dart';

class HomeViewModel extends ChangeNotifier {
  final ArticleService _articleService = ArticleService();
  List<Article> topHeadlines = [];
  List<Article> bookmark = [];
  int page = 1;
  static const int pageLimit = 20;

  Future<void> getTopHeadlines() async {
    page = 1;

    topHeadlines =
        await _articleService.getTopArticles(pageSize: pageLimit, page: page);
    ++page;
    notifyListeners();
  }

  addToBookmark(Article article) {
    bookmark.add(article);
    notifyListeners();
  }

  getMore() async {
    //get more articl and add it to the current list
    topHeadlines.addAll(
        await _articleService.getTopArticles(pageSize: pageLimit, page: page));
    //increase page to set current page
    ++page;
    //notify state
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
