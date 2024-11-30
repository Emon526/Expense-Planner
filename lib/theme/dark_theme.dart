import 'package:flutter/material.dart';

import 'switchthemeadaptation.dart';
import 'theme.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

ThemeData platformSpecificDarkTheme() {
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
    brightness: Brightness.dark,
    primaryColor: secondaryColor,
    // canvasColor: Colors.white,
    fontFamily: fontFamily,
    indicatorColor: secondaryColor,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: secondaryColor,
      selectionColor: secondaryColor.withOpacity(0.2),
      selectionHandleColor: secondaryColor,
    ),
    appBarTheme: AppBarTheme(
        //centerTitle: true,
        iconTheme: IconThemeData(color: secondaryColor),
        actionsIconTheme: IconThemeData(color: secondaryColor)),

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Colors.white,
    ),

    snackBarTheme: SnackBarThemeData(
      insetPadding: EdgeInsets.symmetric(
          horizontal: 20, vertical: 10), // Less aggressive padding
      backgroundColor: secondaryColor,
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
        color: secondaryColor,
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
        return Colors.white;
      }),
      todayBackgroundColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return secondaryColor;
        }
        return null;
      }),
      dayBackgroundColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return secondaryColor;
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
        return Colors.white;
      }),
      yearBackgroundColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return null;
        }
        if (states.contains(WidgetState.selected)) {
          return secondaryColor;
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
        return Colors.white;
      }),
      cancelButtonStyle:
          ButtonStyle(foregroundColor: WidgetStatePropertyAll(secondaryColor)),
      confirmButtonStyle:
          ButtonStyle(foregroundColor: WidgetStatePropertyAll(secondaryColor)),
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        // fontSize: 24,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        // fontSize: 18,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        // fontSize: 12,
      ),
      titleLarge: TextStyle(
        color: Colors.white,
        // fontSize: 24,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        //  fontSize: 18,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        // fontSize: 16,
      ),
    ),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4), // Adjust the radius
      ),
      tileColor: secondaryColor,
      iconColor: Colors.white,
      textColor: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      suffixIconColor: secondaryColor,
      floatingLabelStyle: const TextStyle(
        color: secondaryColor,
      ),
      focusColor: secondaryColor,
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
          color: secondaryColor,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        // borderRadius: BorderRadius.all(
        //   Radius.circular(20),
        // ),
        borderSide: BorderSide(
          width: 2.0,
          color: secondaryColor,
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
      activeTrackColor: secondaryColor,
      inactiveTrackColor: secondaryColor.withOpacity(0.5),
      thumbColor: secondaryColor,
      overlayColor: secondaryColor.withOpacity(0.5),
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
          return secondaryColor;
        }
        return null;
      }),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: secondaryColor,
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
              return secondaryColor; // Selected background color
            }
            return secondaryColor; // Default enabled background color
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
        // textStyle: WidgetStatePropertyAll(TextStyle(
        //   color: Colors.white,
        // )),
        side: WidgetStatePropertyAll(BorderSide(
          width: 1,
          color: secondaryColor,
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
              return secondaryColor
                  .withOpacity(0.1); // Selected background color
            }
            return secondaryColor
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
        primaryColor: secondaryColor, // iOS-specific color
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
