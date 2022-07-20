import 'package:news_app/constants/keys.dart';

class ApiRoute {
  static String baseUrl = "https://newsapi.org";
  static String topHeadlines(int pageSize, int page) =>
      "$baseUrl/v2/top-headlines?country=ng&apiKey=${AppKeys.apiKey}&pageSize=$pageSize&page=$page";
  static String articleByCategory(String category, int pageSize, int page) =>
      "$baseUrl/v2/top-headlines?country=ng&category=$category&apiKey=${AppKeys.apiKey}&pageSize=$pageSize&page=$page";
}
