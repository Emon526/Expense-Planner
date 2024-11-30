import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/chartprovider.dart';
import '../providers/transaction_provider.dart';
import '../utils/utils.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactions = context.watch<TransactionProvider>().userTransactions;
    return Consumer<ChartProvider>(builder: (context, chartProvider, child) {
      return Card(
        elevation: 6,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Transaction Chart:',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    width: Utils(context).getScreenSize.width * 0.01,
                  ),
                  DropdownButton<int>(
                    value: chartProvider.selectedDays,
                    items: chartProvider.selectedDaysList
                        .map(
                          (days) => DropdownMenuItem(
                            value: days,
                            child: Text('Last $days Days'),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        chartProvider.selectedDays = value;
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: chartProvider
                      .groupTransactionValues(transactions)
                      .map((data) {
                    return Flexible(
                      fit: FlexFit.tight,
                      child: ChartBar(
                          label: data['day'] as String,
                          spendingAmount: data['amount'] as double,
                          spendingPercentOfTotal:
                              chartProvider.totalSpending(transactions) == 0.0
                                  ? 0.0
                                  : (data['amount'] as double) /
                                      chartProvider
                                          .totalSpending(transactions)),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
