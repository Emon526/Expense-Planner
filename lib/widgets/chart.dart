import 'package:expense_planner/providers/chartprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';
import 'dart:developer';

class Chart extends StatefulWidget {
  final List<TransactionModel> recentTransactions;

  Chart(this.recentTransactions);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Transaction Chart',
                  //    style: Theme.of(context).textTheme.headline6,
                ),
                DropdownButton<int>(
                  value: context.watch<ChartProvider>().selectedDays,
                  items: context
                      .watch<ChartProvider>()
                      .selectedDaysList
                      .map(
                        (days) => DropdownMenuItem(
                          value: days,
                          child: Text('Last $days Days'),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      context.read<ChartProvider>().selectedDays = value;
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: groupTransactionValues.map((data) {
                  return Flexible(
                    fit: FlexFit.tight,
                    child: ChartBar(
                        data['day'] as String,
                        data['amount'] as double,
                        totalSpending == 0.0
                            ? 0.0
                            : (data['amount'] as double) / totalSpending),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Map<String, Object>> get groupTransactionValues {
    // debugPrint(widget.recentTransactions.toString());
    log(widget.recentTransactions.toString());
    return List.generate(
      context.watch<ChartProvider>().selectedDays,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );
        var totalSum = 0.0;

        for (var i = 0; i < widget.recentTransactions.length; i++) {
          if (widget.recentTransactions[i].date.day == weekDay.day &&
              widget.recentTransactions[i].date.month == weekDay.month &&
              widget.recentTransactions[i].date.year == weekDay.year) {
            totalSum += widget.recentTransactions[i].amount;
          }
        }

        return {
          'day': DateFormat.E().format(weekDay).substring(0, 1),
          'amount': totalSum,
        };
      },
    ).reversed.toList();
  }

  double get totalSpending {
    return groupTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }
}
