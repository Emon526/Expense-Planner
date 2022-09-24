import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class TransactionModel {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  TransactionModel({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount.toString(),
      'date': DateFormat.yMd().format(date).toString(),
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      amount: double.parse(map['amount']) ?? '',
      date: DateFormat.yMd().parse(map['date']) ?? '',
    );
  }
  @override
  String toString() =>
      'trans(id: $id, title: $title, amount: $amount, date: $date)';
}
