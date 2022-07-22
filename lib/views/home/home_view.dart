// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:news_app/enums/news_category.dart';
import 'package:news_app/extensions/extension.dart';
import 'package:news_app/views/home/category_view.dart';
import 'package:news_app/views/home/view_models/category_view_model.dart';

import 'package:news_app/views/home/view_models/home_view_model.dart';
import 'package:news_app/widgets/article_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key, required this.homeViewModel}) : super(key: key);

  final HomeViewModel homeViewModel;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  @override
  void initState() {
    widget.homeViewModel.getTopHeadlines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (tappedIndex) {
            setState(() {
              selectedIndex = tappedIndex;
            });
          },
          currentIndex: selectedIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark), label: "Bookmark"),
          ]),
      body: SafeArea(
        child: selectedIndex == 1
            ? ListView.builder(
                itemCount: widget.homeViewModel.bookmark.length,
                itemBuilder: (context, index) {
                  final article = widget.homeViewModel.bookmark[index];
                  return ArticleWidget(article: article);
                },
              )
            : DefaultTabController(
                length: ArticlesCategory.values.length + 1,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Ink.image(
                        image: const AssetImage("assets/images/logo.png"),
                        height: 40,
                        width: 100,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      isScrollable: true,
                      tabs: [
                        const Text("All news"),
                        for (ArticlesCategory item in ArticlesCategory.values)
                          Tab(
                              // iconMargin: EdgeInsets.all(0),
                              height: 20,
                              text: item.name.capitaliseFirstLetter())
                      ],
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: TabBarView(
                        children: [
                          AnimatedBuilder(
                            animation: widget.homeViewModel,
                            builder: (context, _) {
                              return NotificationListener(
                                onNotification: (Notification notification) {
// flutter: ScrollEndNotification(depth: 0 (local), FixedScrollMetrics(0.0..[584.0]..1965.0))
// flutter: UserScrollNotification(depth: 0 (local), FixedScrollMetrics(0.0..[584.0]..1965.0), direction: ScrollDirection.idle)
// flutter: ScrollMetricsNotification(depth: 0 (local), FixedScrollMetrics(0.0..[584.0]..1965.0))
//  ScrollMetricsNotification
// flutter: ScrollUpdateNotification
// flutter: ScrollEndNotification
// flutter: UserScrollNotification
                                  // dynamic d = "33"; //"ormorom"
                                  // switch (d.runtimeType) {
                                  //   case int:
                                  //   case double:
                                  //   case num:
                                  //     num r = d as num;

                                  //     r++;

                                  //     break;
                                  //   default:
                                  // }

                                  // print(notification);
                                  switch (notification.runtimeType) {
                                    // here we would capture all scroll event
                                    case ScrollUpdateNotification:
                                    case ScrollEndNotification:
                                    case UserScrollNotification:
                                      final notificationListener =
                                          notification as ScrollNotification;

                                      if (notificationListener.metrics.pixels >
                                          notificationListener
                                                  .metrics.maxScrollExtent -
                                              300) {
                                        widget.homeViewModel.getMore();
                                      }
                                      break;
                                    // here we ignore all other events
                                    default:
                                      break;
                                  }
                                  return false;
                                },
                                child: RefreshIndicator(
                                  onRefresh:
                                      widget.homeViewModel.getTopHeadlines,
                                  child: CustomScrollView(
                                    slivers: [
                                      SliverToBoxAdapter(
                                        child: Text("Top Headlines",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5),
                                      ),
                                      SliverList(
                                        delegate: SliverChildBuilderDelegate(
                                          (context, index) {
                                            final article = widget.homeViewModel
                                                .topHeadlines[index];
                                            final bool isBookmarked = widget
                                                .homeViewModel.bookmark
                                                .contains(article);
                                            return ArticleWidget(
                                              article: article,
                                              isBookmarked: isBookmarked,
                                              onBookmark: isBookmarked
                                                  ? widget.homeViewModel
                                                      .removeFromBookmark
                                                  : widget.homeViewModel
                                                      .addToBookmark,
                                            ); // return Text(homeViewModel.topHeadlines[index].title);
                                          },
                                          childCount: widget.homeViewModel
                                              .topHeadlines.length,
                                        ),
                                      ),
                                      if (widget.homeViewModel.isLoading)
                                        const SliverToBoxAdapter(
                                          child: Center(
                                            child: CircularProgressIndicator
                                                .adaptive(),
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          for (ArticlesCategory item in ArticlesCategory.values)
                            // Tab(item.name);
                            CategoryView(
                              category: item.name,
                              categoryViewModel: CategoryViewModel(item.name),
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
