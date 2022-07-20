import 'dart:convert';

import 'package:news_app/constants/api_routes.dart';
import 'package:news_app/models/article.dart';
import 'package:http/http.dart' as http;

class ArticleService {
  Future<List<Article>> getTopArticles(
      {int pageSize = 20, int page = 1}) async {
    final Uri url = Uri.parse(ApiRoute.topHeadlines(pageSize, page));
    return _getArticleFromServer(url);
  }

  Future<List<Article>> getArticlesByCategory(String category,
      {int pageSize = 20, int page = 1}) async {
    final Uri url =
        Uri.parse(ApiRoute.articleByCategory(category, pageSize, page));
    return _getArticleFromServer(url);
  }

  Future<List<Article>> _getArticleFromServer(Uri url) async {
    final http.Response response = await http.get(url);
    final List result = jsonDecode(response.body)["articles"];
    return result.map<Article>((item) => Article.fromJson(item)).toList();
  }
}
