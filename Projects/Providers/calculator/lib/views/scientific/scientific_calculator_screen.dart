import 'package:flutter/material.dart';

class ScientificCalculatorPageScreen extends StatelessWidget {
  const ScientificCalculatorPageScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Scientific Calculator Page',
        ),
      ),
      body: Center(
        child: Text(
          'Page Under Construction!',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
