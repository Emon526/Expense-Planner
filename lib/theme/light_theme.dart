import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:expense_planner/theme/switchthemeadaptation.dart';
import 'theme.dart';

ThemeData platformSpecificLightTheme() {
  // Common theme for all platforms
  ThemeData commonTheme = ThemeData(
    adaptations: <Adaptation<Object>>[
      SwitchThemeAdaptation(),
      // SliderThemeAdaptation(),
      // CircularProgressIndicatorThemeAdaptation(),
      // CheckboxThemeAdaptation(),
      // RadioThemeAdaptation(),
      // AlertDialogThemeAdaptation(),
    ],
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: primaryColor,
    // canvasColor: Colors.white,
    fontFamily: fontFamily,
    indicatorColor: primaryColor,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primaryColor,
      selectionColor: primaryColor..withOpacity(0.2),
      selectionHandleColor: primaryColor,
    ),

    appBarTheme: AppBarTheme(
      // centerTitle: true,
      iconTheme: IconThemeData(color: primaryColor),
      actionsIconTheme: IconThemeData(color: primaryColor),
    ),

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Colors.white,
    ),
    snackBarTheme: SnackBarThemeData(
      insetPadding: EdgeInsets.symmetric(
          horizontal: 20, vertical: 10), // Less aggressive padding
      backgroundColor: primaryColor,
      contentTextStyle: TextStyle(color: Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4), // Slightly more rounded
      ),
      behavior: SnackBarBehavior.floating,
    ),
    datePickerTheme: DatePickerThemeData(
      // backgroundColor: Colors.white,
      // dayOverlayColor: WidgetStatePropertyAll(Colors.amberAccent),
      // inputDecorationTheme: InputDecorationTheme(fillColor: Colors.amber),
      // shadowColor: Colors.amber,
      todayBorder: BorderSide(
        color: primaryColor,
      ),

      // surfaceTintColor: Colors.red,
      todayForegroundColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return Colors.black;
      }),
      todayBackgroundColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return primaryColor;
        }
        return null;
      }),
      dayBackgroundColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return primaryColor;
        }
        return null;
      }),
      dayForegroundColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return Colors.black;
      }),
      yearBackgroundColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return primaryColor;
        }
        return null;
      }),
      yearForegroundColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return Colors.black;
      }),
      cancelButtonStyle:
          ButtonStyle(foregroundColor: WidgetStatePropertyAll(primaryColor)),
      confirmButtonStyle:
          ButtonStyle(foregroundColor: WidgetStatePropertyAll(primaryColor)),
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black87,
        // fontSize: 24,
      ),
      bodyMedium: TextStyle(
        color: Colors.black87,
        //fontSize: 18,
      ),
      bodySmall: TextStyle(
        color: Colors.black87,
        // fontSize: 12,
      ),
      titleLarge: TextStyle(
        color: Colors.black87,
        // fontSize: 24,
      ),
      titleMedium: TextStyle(
        color: Colors.black87,
        //  fontSize: 18,
      ),
      titleSmall: TextStyle(
        color: Colors.black87,
        //  fontSize: 16,
      ),
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4), // Adjust the radius
      ),
      tileColor: primaryColor,
      iconColor: Colors.white,
      textColor: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      suffixIconColor: primaryColor,
      floatingLabelStyle: const TextStyle(
        color: primaryColor,
      ),
      focusColor: primaryColor,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      border: const OutlineInputBorder(
        // borderRadius: BorderRadius.all(
        //   Radius.circular(20),
        // ),
        borderSide: BorderSide(
          width: 2.0,
          color: primaryColor,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        // borderRadius: BorderRadius.all(
        //   Radius.circular(20),
        // ),
        borderSide: BorderSide(
          width: 2.0,
          color: primaryColor,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        // borderRadius: BorderRadius.all(
        //   Radius.circular(20),
        // ),
        borderSide: BorderSide(
          width: 2.0,
          color: Colors.red,
        ),
      ),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: primaryColor,
      inactiveTrackColor: primaryColor.withOpacity(0.5),
      thumbColor: primaryColor,
      overlayColor: primaryColor.withOpacity(0.5),
    ),
    switchTheme: SwitchThemeData(
      thumbColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return Colors.white;
      }),
      trackColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return primaryColor;
        }
        return null;
      }),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        // padding: WidgetStatePropertyAll(
        //   const EdgeInsets.symmetric(
        //     vertical: 20,
        //     horizontal: 40,
        //   ),
        // ),

        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),

        foregroundColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          }
          return Colors.white;
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return Colors.grey[400]; // Disabled background color
            }
            if (states.contains(WidgetState.selected)) {
              return primaryColor; // Selected background color
            }
            return primaryColor; // Default enabled background color
          },
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        // textStyle: WidgetStateProperty.all(
        //   TextStyle(
        //     color: primaryColor,
        //     decorationColor: Colors.red,
        //     // Avoid using `backgroundColor` in `TextStyle`, it might not work as expected
        //   ),
        // ),
        foregroundColor:
            WidgetStateProperty.all(Colors.white), // This sets the text color
        overlayColor: WidgetStateProperty.all(Colors.white.withOpacity(0.2)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        //   textStyle: WidgetStatePropertyAll(TextStyle(
        //     color: Colors.white,
        //   )),
        side: WidgetStatePropertyAll(BorderSide(
          width: 1,
          color: primaryColor,
        )),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),

        foregroundColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          if (states.contains(WidgetState.selected)) {
            return Colors.black;
          }
          return Colors.black;
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return Colors.grey[400]; // Disabled background color
            }
            if (states.contains(WidgetState.selected)) {
              return primaryColor.withOpacity(0.1); // Selected background color
            }
            return primaryColor
                .withOpacity(0.1); // Default enabled background color
          },
        ),
      ),
    ),
  );

  // Platform-specific adaptations
  if (Platform.isIOS) {
    return commonTheme.copyWith(
      // appBarTheme: commonTheme.appBarTheme.copyWith(
      //   backgroundColor: Colors.white, // Example: White AppBar for iOS
      //   iconTheme: IconThemeData(color: Colors.blue),
      // ),
      cupertinoOverrideTheme: CupertinoThemeData(
        primaryColor: primaryColor, // iOS-specific color
      ),
    );
  } else if (Platform.isAndroid) {
    return commonTheme.copyWith(
        // appBarTheme: commonTheme.appBarTheme.copyWith(
        //   backgroundColor: primaryColor, // Example: Primary AppBar for Android
        // ),
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: primaryColor,
        //     foregroundColor: Colors.white,
        //   ),
        // ),
        );
  } else if (defaultTargetPlatform == TargetPlatform.macOS ||
      defaultTargetPlatform == TargetPlatform.windows) {
    return commonTheme.copyWith(
        // textTheme: commonTheme.textTheme.copyWith(
        //   bodyLarge: TextStyle(color: Colors.blueGrey),
        // ),
        );
  } else {
    // Default fallback theme
    return commonTheme;
  }
}
