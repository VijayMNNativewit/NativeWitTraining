import 'dart:math';

import 'package:flutter/material.dart';

class Calculator extends ChangeNotifier {
  final List<String> numbers = <String>[
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '.',
  ];
  final List<String> signOperators = <String>[
    '+',
    '-',
  ];
  final List<String> operators = <String>[
    '+',
    '-',
    '*',
    '/',
    '%',
    '^',
  ];
  String _displayText = ' ';
  String get displayText => _displayText;
  set displayText(String value) {
    _displayText = value;
    notifyListeners();
  }

  List<String> _expressionHistory = <String>[];
  List<String> get expressionHistory => _expressionHistory;
  set expressionHistory(List<String> value) {
    _expressionHistory = value;
    notifyListeners();
  }

  List<String> _expressionResultHistory = <String>[];
  List<String> get expressionResultHistory => _expressionResultHistory;
  set expressionResultHistory(List<String> value) {
    _expressionResultHistory = value;
    notifyListeners();
  }

  void onKeyPressed(String inputValue) {
    if (inputValue == 'AC') {
      displayText = ' ';
    } else if (inputValue == 'C') {
      displayText = displayText.substring(0, displayText.length - 1);
    } else if (inputValue == '=') {
      expressionHistory.add(displayText);
      final String temp = compute(displayText).toString();
      expressionResultHistory.add(temp);
      displayText = temp;
      // displayText = compute('1+5*6').toString();
    } else {
      if (operators.contains(displayText[displayText.length - 1]) &&
          operators.contains(inputValue)) {
        displayText =
            displayText.substring(0, displayText.length - 1) + inputValue;
      } else {
        displayText += inputValue;
      }
    }
  }

  double compute(String tokens) {
    final List<double> values = <double>[];
    final List<String> operators = <String>[];
    int i = 0;

    while (i < tokens.length) {
      if (tokens[i] == ' ') {
        i += 1;
        continue;
      } else if (tokens[i] == '(') {
        operators.add(tokens[i]);
      } else if (numbers.contains(tokens[i])) {
        double value = 0;
        bool decimalCheck = false;
        int j = 1;
        while (i < tokens.length && numbers.contains(tokens[i])) {
          if (tokens[i] == '.') {
            decimalCheck = true;
            i += 1;
            continue;
          } else if (decimalCheck) {
            j += 1;
            value = value + double.parse(tokens[i]) * 0.10;
          } else {
            value = value * 10 + double.parse(tokens[i]);
          }

          i += 1;
        }
        values.add(value);
        i -= 1;
      } else if (tokens[i] == ')') {
        while (operators.isNotEmpty && operators.last != '(') {
          final double value2 = values.removeLast();
          final double value1 = values.removeLast();
          final String operator = operators.removeLast();
          values.add(applyOperation(value1, value2, operator));
        }
        operators.removeLast();
      } else {
        while (operators.isNotEmpty &&
            precedence(operators.last) >= precedence(tokens[i])) {
          final double value2 = values.removeLast();
          final double value1 = values.removeLast();
          final String operator = operators.removeLast();
          values.add(applyOperation(value1, value2, operator));
        }
        operators.add(tokens[i]);
      }
      i += 1;
    }
    while (operators.isNotEmpty) {
      final double value2 = values.removeLast();
      final double value1 = values.removeLast();
      final String operator = operators.removeLast();
      values.add(applyOperation(value1, value2, operator));
    }
    return values.removeLast();
  }

  int precedence(String operator) {
    if (operator == '+' || operator == '-') {
      return 1;
    }
    if (operator == '*' || operator == '/' || operator == '%') {
      return 2;
    }
    return 0;
  }

  double applyOperation(double operand1, double operand2, String operator) {
    if (operator == '+') {
      return operand1 + operand2;
    }
    if (operator == '-') {
      return operand1 - operand2;
    }
    if (operator == '*') {
      return operand1 * operand2;
    }
    if (operator == '/') {
      return operand1 / operand2;
    }
    if (operator == '%') {
      return operand1 % operand2;
    }
    if (operator == '^') {
      return pow(operand1, operand2).toDouble();
    }
    return 0;
  }
}
