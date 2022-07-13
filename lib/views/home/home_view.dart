import 'package:flutter/material.dart';
import 'package:news_app/views/home/view_models/home_view_model.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final homeViewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: homeViewModel,
        builder: (context, widget) {
          return Container(color: Colors.red);
        },
      ),
    );
  }
}
