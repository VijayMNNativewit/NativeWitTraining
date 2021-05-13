import 'package:flutter/material.dart';
import 'package:to_do/views/home/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:to_do/views/test_page/test_page_ui.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const HomePage(),
      home: const TestUI(),
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
