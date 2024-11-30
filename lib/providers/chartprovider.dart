import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class ChartProvider with ChangeNotifier {
  int _selectedDays = 7;
  int get selectedDays => _selectedDays;

  void set selectedDays(int value) {
    if (value != _selectedDays) {
      _selectedDays = value;
      notifyListeners();
    }
  }

  List<int> _selectedDaysList = [
    7,
    15,
    30,
  ];

  List<int> get selectedDaysList => _selectedDaysList;

  List<Map<String, Object>> groupTransactionValues(
      List<TransactionModel> transactions) {
    return List.generate(
      _selectedDays,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );
        var totalSum = 0.0;

        for (var i = 0; i < transactions.length; i++) {
          if (transactions[i].date.day == weekDay.day &&
              transactions[i].date.month == weekDay.month &&
              transactions[i].date.year == weekDay.year) {
            totalSum += transactions[i].amount;
          }
        }

        return {
          'day': DateFormat.E().format(weekDay).substring(0, 1),
          'amount': totalSum,
        };
      },
    ).reversed.toList();
  }

  // Calculate total spending using the groupTransactionValues
  double totalSpending(List<TransactionModel> transactions) {
    return groupTransactionValues(transactions).fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }
}
