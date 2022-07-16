// ignore_for_file: public_member_api_docs, sort_constructors_first

// news object
class Article {
  String title;
  ArticleSource source;
  String? image;
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
      image: json["urlToImage"],
      content: json["content"] ?? "",
      publishedAt: DateTime.parse(json["publishedAt"]).toLocal(),
      source: ArticleSource.fromJson(json["source"]),
    );
  }

  @override
  operator ==(covariant Article other) =>
      other.image == image &&
      other.content == content &&
      other.publishedAt == publishedAt &&
      other.title == title &&
      other.source == source;

  @override
  int get hashCode =>
      image.hashCode ^
      content.hashCode ^
      publishedAt.hashCode ^
      title.hashCode ^
      source.hashCode;
}

class ArticleSource {
  String name;

  ArticleSource({required this.name});

  factory ArticleSource.fromJson(Map<String, dynamic> json) =>
      ArticleSource(name: json["name"]);

  @override
  operator ==(covariant ArticleSource other) => other.name == name;

  @override
  int get hashCode => name.hashCode;
}
