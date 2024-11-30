import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';
import 'providers/chartprovider.dart';
import 'providers/themeprovider.dart';
import 'providers/transaction_provider.dart';
import 'theme/theme.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    void removeSplash() async => await Future.delayed(
        const Duration(seconds: 3), () => FlutterNativeSplash.remove());

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
            removeSplash();
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
