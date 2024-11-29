import 'package:flutter/material.dart';

import 'theme.dart';

class SwitchThemeAdaptation extends Adaptation<SwitchThemeData> {
  SwitchThemeAdaptation();

  @override
  SwitchThemeData adapt(ThemeData theme, SwitchThemeData defaultValue) =>
      SwitchThemeData(
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
            return theme.brightness == Brightness.dark
                ? secondaryColor
                : primaryColor;
          }
          return null;
        }),
      );
}
