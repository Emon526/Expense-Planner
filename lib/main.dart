import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';
import 'providers/chartprovider.dart';
import 'providers/themeprovider.dart';
import 'providers/transaction_provider.dart';
import 'theme/theme.dart';

void main() {
  runApp(const MyApp());
}

//TODO:: Check Responsive (100% responsive done)
//TODO:: Remove todo when git push
//TODO:: Git push message (Responsive & Adaptive Theme)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ThemeProvider()..initializeTheme()),
        ChangeNotifierProvider(
            create: (_) => TransactionProvider()..getHistories()),
        ChangeNotifierProvider(
          create: (_) => ChartProvider(),
        ),
      ],
      builder: (context, child) {
        return Consumer<ThemeProvider>(
          builder: (
            context,
            value,
            child,
          ) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Expense Planner',
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: context.watch<ThemeProvider>().themeMode,
              home: HomePage(),
            );
          },
        );
      },
    );
  }
}
