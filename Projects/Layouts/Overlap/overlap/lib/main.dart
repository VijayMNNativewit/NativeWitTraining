import 'package:flutter/material.dart';
import 'package:overlap/views/loginpage.dart';
import 'package:overlap/views/registerpage.dart';
import 'package:overlap/views/welcomepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Practice',
      home: WelcomePage(),
    );
  }
}





