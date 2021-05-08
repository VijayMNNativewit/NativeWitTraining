import 'package:flutter/material.dart';
import 'package:to_do/views/home/home_page.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: buildThemeData(),
    );
  }

  ThemeData buildThemeData() {
    return ThemeData(
      iconTheme: const IconThemeData(
        color: Colors.white,
        size: 32,
      ),
      primaryIconTheme: const IconThemeData(
        color: Colors.red,
        size: 32,
      ),
      textTheme: const TextTheme(
        headline4: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        headline6: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        subtitle1: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
