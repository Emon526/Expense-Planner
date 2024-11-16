import 'package:expense_planner/providers/transaction_provider.dart';
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
}
