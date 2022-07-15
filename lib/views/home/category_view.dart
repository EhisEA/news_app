import 'package:flutter/material.dart';
import 'package:news_app/views/home/view_models/category_view_model.dart';
import 'package:news_app/widgets/article_widget.dart';

class CategoryView extends StatelessWidget {
  const CategoryView(
      {Key? key, required this.category, required this.categoryViewModel})
      : super(key: key);

  final String category;
  final CategoryViewModel categoryViewModel;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: categoryViewModel,
      builder: (context, _) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child:
                  Text(category, style: Theme.of(context).textTheme.headline5),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final article = categoryViewModel.articles[index];
                  return ArticleWidget(article: article);
                },
                childCount: categoryViewModel.articles.length,
              ),
            )
          ],
        );
      },
    );
  }
}
