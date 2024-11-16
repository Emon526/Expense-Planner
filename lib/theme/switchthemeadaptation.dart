import 'package:flutter/material.dart';

import 'theme.dart';

class SwitchThemeAdaptation extends Adaptation<SwitchThemeData> {
  bool isDark = false;
  SwitchThemeAdaptation({required this.isDark});

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
            return isDark ? secondaryColor : primaryColor;
          }
          return null;
        }),
      );
}
