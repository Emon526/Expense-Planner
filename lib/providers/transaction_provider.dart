import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../services/database_service.dart';

class TransactionProvider extends ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService();
  bool _showChart = false;
  bool get showChart => _showChart;
  List<TransactionModel> _userTransactions = [];
  List<TransactionModel> get userTransactions => _userTransactions;

  /// Fetches transaction histories from the database and updates [_userTransactions]
  Future<void> getHistories() async {
    final data = await _databaseService.histories();
    _userTransactions = data;
    notifyListeners(); // Notify listeners after data is updated
  }

  /// Adds a new transaction to the list and updates the database
  Future<void> addNewTransaction(
    String txtitle,
    double txamount,
    DateTime chosenDate,
  ) async {
    final newTx = TransactionModel(
      title: txtitle,
      amount: txamount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    await _databaseService.insertHistory(newTx);

    _userTransactions = [
      ..._userTransactions,
      newTx
    ]; // Update the list with new transaction
    notifyListeners(); // Notify listeners after adding
  }

  /// Deletes a transaction from the list and the database
  Future<void> deleteTransaction(String id) async {
    await _databaseService.deleteHistory(id);
    _userTransactions = _userTransactions.where((tx) => tx.id != id).toList();
    notifyListeners(); // Notify listeners after deletion
  }

  List<TransactionModel> get recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(Duration(days: 7)),
      );
    }).toList();
  }

  void toggleShowChart() {
    _showChart = !_showChart;
    notifyListeners();
  }
}
