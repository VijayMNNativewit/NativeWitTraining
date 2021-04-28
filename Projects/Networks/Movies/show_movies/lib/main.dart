import 'package:flutter/material.dart';
import 'package:show_movies/views/home/home_page.dart';

void main() {
  runApp(const ShowMoviesApp());
}

class ShowMoviesApp extends StatelessWidget {
  const ShowMoviesApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Show Movies Flutter App',
      home: const HomePage(),
      theme: ThemeData(
        iconTheme: const IconThemeData(
          size: 8,
          color: Colors.white,
        ),
        primaryIconTheme: const IconThemeData(
          size: 30,
          color: Colors.white,
        ),
        accentIconTheme: const IconThemeData(
          size: 24,
          color: Colors.white,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline2: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline3: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline4: TextStyle(
            fontSize: 14,
            color: Colors.blue,
          ),
          subtitle1: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
          subtitle2: TextStyle(
            fontSize: 14.0,
            color: Colors.white,
          ),
          bodyText1: TextStyle(
            color: Colors.grey,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
