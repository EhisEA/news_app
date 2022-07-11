import 'dart:convert';

import 'package:news_app/constants/api_routes.dart';
import 'package:news_app/models/article.dart';
import 'package:http/http.dart' as http;

class ArtcleService {
  Future<List<Article>> getArticles() async {
    final Uri url = Uri.parse(ApiRoute.topHeadlines);
    return _getArticleFromServer(url);
  }

  Future<List<Article>> getArticlesByCategory(String category) async {
    final Uri url = Uri.parse(ApiRoute.articleByCategory(category));
    return _getArticleFromServer(url);
  }

  Future<List<Article>> _getArticleFromServer(Uri url) async {
    final http.Response response = await http.get(url);
    final List<Map<String, dynamic>> result =
        jsonDecode(response.body)["articles"];
    return result.map<Article>((item) => Article.fromJson(item)).toList();
  }
}
