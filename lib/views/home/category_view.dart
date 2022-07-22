import 'package:flutter/material.dart';
import 'package:news_app/views/home/view_models/bookmark_view_model.dart';
import 'package:news_app/views/home/view_models/category_view_model.dart';
import 'package:news_app/widgets/article_widget.dart';

class CategoryView extends StatelessWidget {
  CategoryView(
      {Key? key,
      required this.category,
      required this.categoryViewModel,
      required this.bookMarkViewModel})
      : super(key: key);

  final String category;
  final CategoryViewModel categoryViewModel;
  final BookMarkViewmodel bookMarkViewModel;

  late final listeners =
      Listenable.merge([bookMarkViewModel, categoryViewModel]);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: listeners,
      builder: (context, _) {
        return NotificationListener(
          onNotification: (Notification notification) {
            switch (notification.runtimeType) {
              // here we would capture all scroll event
              case ScrollUpdateNotification:
              case ScrollEndNotification:
              case UserScrollNotification:
                final notificationListener = notification as ScrollNotification;

                if (notificationListener.metrics.pixels >
                    notificationListener.metrics.maxScrollExtent - 300) {
                  categoryViewModel.getMore();
                }
                break;
              // here we ignore all other events
              default:
                break;
            }
            return false;
          },
          child: RefreshIndicator(
            onRefresh: categoryViewModel.getArticles,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Text("Top Headlines",
                      style: Theme.of(context).textTheme.headline5),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final article = categoryViewModel.articles[index];
                      final bool isBookmarked =
                          bookMarkViewModel.bookmark.contains(article);
                      return ArticleWidget(
                        article: article,
                        isBookmarked: isBookmarked,
                        onBookmark: isBookmarked
                            ? bookMarkViewModel.removeFromBookmark
                            : bookMarkViewModel.addToBookmark,
                      ); // return Text(homeViewModel.topHeadlines[index].title);
                    },
                    childCount: categoryViewModel.articles.length,
                  ),
                ),
                if (categoryViewModel.isLoading)
                  const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
