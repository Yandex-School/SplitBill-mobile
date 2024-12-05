
import 'package:flutter/material.dart';
import 'app_theme.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppTheme.lightTheme;

  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _currentTheme = _currentTheme.brightness == Brightness.light
        ? AppTheme.darkTheme
        : AppTheme.lightTheme;
    notifyListeners();
  }
}
