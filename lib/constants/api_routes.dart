import 'package:news_app/constants/keys.dart';

class ApiRoute {
  static String baseUrl = "https://newsapi.org";
  static String topHeadlines =
      "$baseUrl/v2/top-headlines?country=ng&apiKey=${AppKeys.apiKey}";
  static String articleByCategory(String category) =>
      "$baseUrl/v2/top-headlines?country=ng&category=$category&apiKey=${AppKeys.apiKey}";
}
