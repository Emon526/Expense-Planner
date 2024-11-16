import 'package:expense_planner/providers/chartprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';
import 'providers/themeprovider.dart';
import 'providers/transaction_provider.dart';
import 'theme/theme.dart';

void main() {
  //for  controlling orientation

  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitDown,
  //   DeviceOrientation.portraitUp,
  // ]);
  runApp(const MyApp());
}

//TODO:: Check Responsive

//TODO:: Custom chart duration
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
              title: 'Personal Expenses',
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: context.watch<ThemeProvider>().themeMode,
              // theme: ThemeData(
              //   fontFamily: 'Quicksand',
              //   // textTheme: ThemeData.light().textTheme.copyWith(
              //   //     headline6: TextStyle(
              //   //       fontWeight: FontWeight.bold,
              //   //       fontFamily: 'OpenSans',
              //   //       fontSize: 18,
              //   //     ),
              //   //     button: TextStyle(color: Colors.white),
              //   //     ),
              //   // appBarTheme: AppBarTheme(
              //   //   toolbarTextStyle: ThemeData.light()
              //   //       .textTheme
              //   //       .copyWith(
              //   //         headline6: TextStyle(
              //   //           fontFamily: 'OpenSans',
              //   //           fontSize: 20,
              //   //           fontWeight: FontWeight.bold,
              //   //         ),
              //   //       )
              //   //       .bodyText2,
              //   //   titleTextStyle: ThemeData.light()
              //   //       .textTheme
              //   //       .copyWith(
              //   //         headline6: TextStyle(
              //   //           fontFamily: 'OpenSans',
              //   //           fontSize: 20,
              //   //           fontWeight: FontWeight.bold,
              //   //         ),
              //   //       )
              //   //       .headline6,
              //   // ),
              //   colorScheme:
              //       ColorScheme.fromSwatch(primarySwatch: Colors.purple).copyWith(
              //     secondary: Colors.amber,
              //   ),
              // ),
              home: HomePage(),
            );
          },
        );
      },
    );
  }
}
