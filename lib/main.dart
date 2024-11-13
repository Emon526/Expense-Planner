import 'package:flutter/material.dart';

import 'homescreen.dart';

void main() {
  //for  controlling orientation

  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitDown,
  //   DeviceOrientation.portraitUp,
  // ]);
  runApp(MyApp());
}

//TODO:: Implement Theme
//TODO :: Implement Provider state management
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
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
      home: MyHomePage(),
    );
  }
}
