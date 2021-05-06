import 'package:calculator/model/calculator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorHistoryPageScreen extends StatelessWidget {
  const CalculatorHistoryPageScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator App - History Page'),
      ),
      body: Center(
        child: Consumer<Calculator>(builder:
            (BuildContext context, Calculator calculator, Widget child) {
          return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        '${calculator.expressionHistory[index]} = ',
                        style: Theme.of(context).textTheme.subtitle1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        calculator.expressionResultHistory[index],
                        style: Theme.of(context).textTheme.subtitle1,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
              itemCount: calculator.expressionHistory.length);
        }),
      ),
    );
  }
}
