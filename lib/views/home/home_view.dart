import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/views/home/view_models/home_view_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final homeViewModel = HomeViewModel();
  final homeViewModel2 = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedBuilder(
          animation: homeViewModel,
          builder: (context, widget) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Text("Top Headlines",
                      style: Theme.of(context).textTheme.headline5),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final article = homeViewModel.topHeadlines[index];
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
                                        Text(timeago
                                            .format(article.publishedAt)),
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
                      // return Text(homeViewModel.topHeadlines[index].title);
                    },
                    childCount: homeViewModel.topHeadlines.length,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class CachedImage extends CachedNetworkImage {
  CachedImage({Key? key, required String image, BoxFit? fit})
      : super(
          key: key,
          fit: fit ?? BoxFit.cover,
          imageUrl: image,
          placeholder: (context, _) => Container(
            color: Colors.black38,
          ),
        );
}
