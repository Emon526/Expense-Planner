import '../models/transaction.dart';
import 'package:flutter/material.dart';
import './transaction_item.dart';

class TransactionLIst extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionLIst(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/slepping.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView(
            children: transactions
                .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transactions: tx,
                      deleteTx: deleteTx,
                    ))
                .toList(),
          );
  }
}
