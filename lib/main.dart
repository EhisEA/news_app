import 'package:flutter/material.dart';
import 'package:news_app/views/home/home_view.dart';
import 'package:news_app/views/home/view_models/bookmark_view_model.dart';
import 'package:news_app/views/home/view_models/home_view_model.dart';

void main() {
  // final h = HomeViewModel();
  // final g = HomeViewModel();
  // h.getTopHeadlines();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryColor: const Color(0xffFC821E),
      ),
      home: Home(
        bookMarkViewmodel: BookMarkViewmodel(),
        homeViewModel: HomeViewModel(),
        child: HomeView(
            // homeViewModel: HomeViewModel(),
            // bookMarkViewModel: BookMarkViewmodel()),
            ),
      ),
    ),
  );
}

class Home extends InheritedWidget {
  Home(
      {Key? key,
      required this.bookMarkViewmodel,
      required this.homeViewModel,
      required Widget child})
      : super(key: key, child: child);

  HomeViewModel homeViewModel;
  BookMarkViewmodel bookMarkViewmodel;
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static Home of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Home>()!;
  }
}
