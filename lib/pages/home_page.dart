import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/themeprovider.dart';
import '../utils/utils.dart';
import '../widgets/new_transaction.dart';
import '../widgets/chart.dart';
import '../providers/transaction_provider.dart';
import '../widgets/emptywidget.dart';
import '../widgets/selectionbuttonwidget.dart';
import '../widgets/transaction_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = Utils(context).mediaQuery;
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: appBar,
            child: pageBody,
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

  _buildAppBar(BuildContext context) {
    return Platform.isIOS
        ? CupertinoNavigationBar(
            backgroundColor: Theme.of(context).canvasColor,
            middle: Text(
              'Expense Planner',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            leading: GestureDetector(
              child: Icon(
                context.watch<ThemeProvider>().themeMode == ThemeMode.system
                    ? CupertinoIcons.device_phone_portrait
                    : context.watch<ThemeProvider>().themeMode ==
                            ThemeMode.light
                        ? CupertinoIcons.sun_max
                        : CupertinoIcons.moon,
              ),
              onTap: () => Utils(context).showCustomDialog(
                child: _themetileWidget(
                  context: context,
                  size: Utils(context).getScreenSize,
                ),
              ),
            ),
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
            title: Text(
              'Expense Planner',
            ),
            leading: IconButton(
              icon: Icon(
                context.watch<ThemeProvider>().themeMode == ThemeMode.system
                    ? Icons.phonelink_setup_outlined
                    : context.watch<ThemeProvider>().themeMode ==
                            ThemeMode.light
                        ? Icons.light_mode_outlined
                        : Icons.dark_mode_outlined,
              ),
              onPressed: () => Utils(context).showCustomDialog(
                child: _themetileWidget(
                  context: context,
                  size: Utils(context).getScreenSize,
                ),
              ),
            ),
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
          separatorBuilder: (context, index) => SizedBox(
            height: Utils(context).getScreenSize.height * 0.005,
          ),
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
            return Chart();
          },
        ),
      ),
      SizedBox(height: mediaQuery.size.height * 0.01),
      txListWidget,
    ];
  }

  List<Widget> _buildLandscapeContent(
    MediaQueryData mediaQuery,
    PreferredSizeWidget appBar,
    Widget txListWidget,
  ) {
    return [
      Consumer<TransactionProvider>(builder: (context, provider, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Show Chart',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Material(
              child: Switch.adaptive(
                value: provider.showChart,
                onChanged: (_) {
                  provider.toggleShowChart();
                },
              ),
            ),
          ],
        );
      }),
      Consumer<TransactionProvider>(
        builder: (context, provider, child) {
          return provider.showChart
              ? Container(
                  height: (mediaQuery.size.height -
                          appBar.preferredSize.height -
                          mediaQuery.padding.top) *
                      0.7,
                  child: Chart(),
                )
              : txListWidget;
        },
      ),
    ];
  }

  void _startAddNewTransaction(BuildContext context) {
    Platform.isIOS
        ? showCupertinoModalPopup(
            context: context,
            builder: (_) {
              return NewTransaction(
                context.read<TransactionProvider>().addNewTransaction,
              );
            },
          )
        : showModalBottomSheet(
            context: context,
            builder: (_) {
              return NewTransaction(
                context.read<TransactionProvider>().addNewTransaction,
              );
            },
          );
  }

  _themetileWidget({
    required BuildContext context,
    required Size size,
  }) {
    return Consumer<ThemeProvider>(builder: (context, provider, child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Select Theme',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Theme.of(context).primaryColor),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SelectionButtonWidget(
                    buttontitle: 'System Theme',
                    iconCondition: provider.themeMode == ThemeMode.system,
                    ontap: () {
                      provider.themeMode = ThemeMode.system;
                    },
                  ),
                  Divider(
                    height: 0,
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                  ),
                  SelectionButtonWidget(
                    iconCondition: provider.themeMode == ThemeMode.light,
                    buttontitle: 'Light Theme',
                    ontap: () {
                      provider.themeMode = ThemeMode.light;
                    },
                  ),
                  Divider(
                    height: 0,
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                  ),
                  SelectionButtonWidget(
                    iconCondition: provider.themeMode == ThemeMode.dark,
                    buttontitle: 'Dark Theme',
                    ontap: () {
                      provider.themeMode = ThemeMode.dark;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
