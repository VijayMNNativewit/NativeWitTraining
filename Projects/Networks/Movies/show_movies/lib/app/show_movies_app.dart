import 'package:flutter/material.dart';
import 'package:show_movies/views/home/home_page.dart';

class ShowMoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Show Movies Flutter App',
      home: HomePage(),
    );
  }
}
