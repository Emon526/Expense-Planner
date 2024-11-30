import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkTheme = false;
  bool get isDarkTheme => _isDarkTheme;

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  Future<void> initializeTheme() async {
    await _loadSavedTheme();
    _detectSystemTheme();
  }

  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    _saveTheme(themeMode.index);
    notifyListeners();
  }

  Future<void> _saveTheme(int themeIndex) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeMode', themeIndex);
  }

  Future<void> _loadSavedTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int themeIndex = prefs.getInt('themeMode') ?? ThemeMode.system.index;
    _themeMode = ThemeMode.values[themeIndex];
    notifyListeners();
  }

  void _detectSystemTheme() {
    _isDarkTheme =
        WidgetsBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark;
    notifyListeners();
  }
}
