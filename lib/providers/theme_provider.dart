import 'package:flutter/material.dart';
import 'package:news_app/services/dark_theme_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemePrefernces themePrefernces = ThemePrefernces();

  bool _darkTheme = false;
  bool get getDarkTheme => _darkTheme;

  set setDarkTheme(bool value) {
    _darkTheme = value;
    themePrefernces.setDarkTheme(value);
    notifyListeners();
  }
}
