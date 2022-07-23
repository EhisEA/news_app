import 'package:news_app/main.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/views/home/article_display.dart';
import 'package:news_app/widgets/cached_image.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({
    Key? key,
    // this.onBookmark,
    // this.isBookmarked = false,
    required this.article,
  }) : super(key: key);

  final Article article;
  // final bool isBookmarked;
  // final Function(Article)? onBookmark;

  @override
  Widget build(BuildContext context) {
    final bookMarkViewmodel = Home.of(context).bookMarkViewmodel;

    final isBooked = bookMarkViewmodel.bookmark.contains(article);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ArticleDisplay(
              article: article,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 110,
          child: Row(
            children: [
              Hero(
                tag: article.title,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  height: 110,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.shade300),
                  child: article.image == null
                      ? const Icon(
                          Icons.image,
                          color: Colors.white,
                          size: 50,
                        )
                      : CachedImage(
                          image: article.image!,
                        ),
                  width: 100,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          article.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(timeago.format(article.publishedAt)),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => isBooked
                              ? bookMarkViewmodel.removeFromBookmark(article)
                              : bookMarkViewmodel.addToBookmark(article),
                          // onBookmark?.call(article),
                          child: Icon(
                            Icons.bookmark,
                            color: isBooked
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
