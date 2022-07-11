// ignore_for_file: public_member_api_docs, sort_constructors_first

// news object
class Article {
  String title;
  ArticleSource source;
  String image;
  String content;
  DateTime publishedAt;

  Article({
    required this.title,
    required this.image,
    required this.content,
    required this.publishedAt,
    required this.source,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json["title"],
      image: json["image"],
      content: json["content"],
      publishedAt: DateTime.parse(json["publishedAt"]).toLocal(),
      source: ArticleSource.fromJson(json["source"]),
    );
  }

  // declartion() {
  //   final article = Article(
  //     title: "show me",
  //     image: "https:image.om",
  //     content: "a lot of text",
  //     publishedAt: DateTime.now(),
  //     source: ArticleSource(id: "rnrnirn", name: "i wrote this"),
  //   );
  //   article.image;
  //   article.publishedAt;
  // }
}

class ArticleSource {
  String id;
  String name;

  ArticleSource({required this.id, required this.name});

  factory ArticleSource.fromJson(Map<String, dynamic> json) =>
      ArticleSource(id: json["id"], name: json["name"]);
}
