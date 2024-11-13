import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/new_transaction.dart';
import '../widgets/chart.dart';
import '../providers/transaction_provider.dart';
import '../widgets/emptywidget.dart';
import '../widgets/transaction_item.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final appBar = _buildAppBar(context);

    final txListWidget = Container(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.7,
      child: _buildTransactionList(),
    );

    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscape)
              ..._buildLandscapeContent(mediaQuery, appBar, txListWidget),
            if (!isLandscape)
              ..._buildPortraitContent(mediaQuery, appBar, txListWidget),
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: appBar as ObstructingPreferredSizeWidget?,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () => _startAddNewTransaction(context),
                  ),
          );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text('Personal Expenses'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  child: Icon(CupertinoIcons.add),
                  onTap: () => _startAddNewTransaction(context),
                ),
              ],
            ),
          )
        : AppBar(
            title: Text('Personal Expenses'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _startAddNewTransaction(context),
              ),
            ],
          );
  }

  Widget _buildTransactionList() {
    return Consumer<TransactionProvider>(
      builder: (context, provider, child) {
        final transactions = provider.userTransactions;

        if (transactions.isEmpty) {
          return EmptyWidget();
        }

        return ListView.separated(
          separatorBuilder: (context, index) => const Divider(thickness: 1),
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final trans = transactions[index];
            return TransactionItem(
              key: ValueKey(trans.id),
              transactions: trans,
              deleteTx: () => provider.deleteTransaction(trans.id),
            );
          },
        );
      },
    );
  }

  List<Widget> _buildPortraitContent(
    MediaQueryData mediaQuery,
    PreferredSizeWidget appBar,
    Widget txListWidget,
  ) {
    return [
      Container(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.3,
        child: Consumer<TransactionProvider>(
          builder: (context, provider, child) {
            return Chart(provider.recentTransactions);
          },
        ),
      ),
      txListWidget,
    ];
  }

  List<Widget> _buildLandscapeContent(
    MediaQueryData mediaQuery,
    PreferredSizeWidget appBar,
    Widget txListWidget,
  ) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Show Chart'),
          Consumer<TransactionProvider>(
            builder: (context, provider, child) {
              return Material(
                child: Switch.adaptive(
                  activeColor: Theme.of(context).colorScheme.secondary,
                  value: provider.showChart,
                  onChanged: (_) {
                    provider.toggleShowChart();
                  },
                ),
              );
            },
          ),
        ],
      ),
      Consumer<TransactionProvider>(
        builder: (context, provider, child) {
          return provider.showChart
              ? Container(
                  height: (mediaQuery.size.height -
                          appBar.preferredSize.height -
                          mediaQuery.padding.top) *
                      0.7,
                  child: Chart(provider.recentTransactions),
                )
              : txListWidget;
        },
      ),
    ];
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(
            context.read<TransactionProvider>().addNewTransaction,
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }
}
