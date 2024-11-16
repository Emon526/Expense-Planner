import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transactions,
    required this.deleteTx,
  }) : super(key: key);

  final TransactionModel transactions;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).canvasColor,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(2),
            child: FittedBox(
              child: Text('\$${transactions.amount}'),
            ),
          ),
        ),
        title: Text(
          transactions.title,
          // style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transactions.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
                icon: Icon(Icons.delete),
                label: Text(
                  'Delete',
                  // style: TextStyle(
                  //   color: Colors.white,
                  // ),
                ),
                onPressed: () {
                  deleteTx();
                },
              )
            : IconButton(
                icon: Icon(Icons.delete),
                //  color: Theme.of(context).errorColor,
                onPressed: () {
                  deleteTx();
                },
              ),
      ),
    );
  }
}
