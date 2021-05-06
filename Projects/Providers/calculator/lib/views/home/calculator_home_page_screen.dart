import 'package:calculator/model/calculator.dart';
import 'package:calculator/views/history/calculator_history_page_screen.dart';
import 'package:calculator/views/scientific/scientific_calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorHomePageScreen extends StatelessWidget {
  const CalculatorHomePageScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator App using Providers'),
      ),
      body: Consumer<Calculator>(
        builder: (BuildContext context, Calculator calculator, Widget child) {
          return Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Text(
                    calculator.displayText,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
              Container(
                color: Colors.grey,
                child: GridViewBuilderWidget(),
              ),
            ],
          );
        },
      ),
    );
  }
}

class GridViewBuilderWidget extends StatelessWidget {
  GridViewBuilderWidget({
    Key key,
  }) : super(key: key);

  final List<String> _calculatorButtonsList = <String>[
    'AC',
    'C',
    '%',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    'SCI',
    '0',
    '.',
    '=',
    'H',
    '(',
    ')',
    '^'
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(
        8.0,
      ),
      itemCount: _calculatorButtonsList.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (BuildContext context, int index) {
        return Consumer<Calculator>(
          builder: (BuildContext context, Calculator calculator, Widget child) {
            return Center(
              child: InkWell(
                child: Text(
                  _calculatorButtonsList[index],
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                onTap: () {
                  if (_calculatorButtonsList[index] == 'H') {
                    Navigator.of(context).push<void>(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const CalculatorHistoryPageScreen(),
                      ),
                    );
                  } else if (_calculatorButtonsList[index] == 'SCI') {
                    Navigator.of(context).push<void>(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const ScientificCalculatorPageScreen(),
                      ),
                    );
                  } else {
                    calculator.onKeyPressed(_calculatorButtonsList[index]);
                  }
                },
              ),
            );
          },
        );
      },
    );
  }
}
