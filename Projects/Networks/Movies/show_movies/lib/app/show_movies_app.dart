import 'package:flutter/material.dart';
import 'package:show_movies/views/home/home_page.dart';

class ShowMoviesApp extends StatelessWidget {
  const ShowMoviesApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Show Movies Flutter App',
      home: HomePage(),
    );
  }
}
