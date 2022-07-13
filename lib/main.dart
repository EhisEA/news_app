import 'package:flutter/material.dart';
import 'package:news_app/views/home/home_view.dart';

void main() {
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryColor: const Color(0xffFC821E),
      ),
      home: HomeView()));
}
