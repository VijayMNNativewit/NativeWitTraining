import 'package:flutter/material.dart';
import 'package:tabbar/views/welcome/welcome_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tab Bar Practice',
      home: WelcomePage(),
    );
  }
}
