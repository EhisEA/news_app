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
  @override
  void initState() {
    widget.homeViewModel.getTopHeadlines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
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
                        return CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                              child: Text("Top Headlines",
                                  style: Theme.of(context).textTheme.headline5),
                            ),
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  final article =
                                      widget.homeViewModel.topHeadlines[index];
                                  return ArticleWidget(
                                    article: article,
                                  ); // return Text(homeViewModel.topHeadlines[index].title);
                                },
                                childCount:
                                    widget.homeViewModel.topHeadlines.length,
                              ),
                            )
                          ],
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
