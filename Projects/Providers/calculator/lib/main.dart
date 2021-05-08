import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/calculator.dart';
import 'views/home/calculator_home_page_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: <ListenableProvider<dynamic>>[
        ChangeNotifierProvider<Calculator>(
          create: (_) {
            return Calculator();
          },
        ),
      ],
      child: const CalculatorApp(),
    ),
  );
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CalculatorHomePageScreen(),
      theme: buildThemeData(),
    );
  }

  ThemeData buildThemeData() {
    return ThemeData(
      textTheme: const TextTheme(
        headline6: TextStyle(
          color: Colors.black,
        ),
        subtitle1: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }
}
