import 'package:news_app/models/article.dart';
import 'package:news_app/views/home/home_view.dart';
import 'package:news_app/widgets/cached_image.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 110,
        child: Row(
          children: [
            Container(
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
                      const Icon(
                        Icons.bookmark,
                        color: Colors.grey,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
