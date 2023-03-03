import 'package:flutter/material.dart';
import 'package:news_app/constants/global_colors.dart';

class Styles {
  static ThemeData themeData(
    bool isDarkTheme,
    BuildContext context,
  ) {
    return ThemeData(
      scaffoldBackgroundColor:
          isDarkTheme ? darkScaffoldColor : lightScaffoldColor,
      hintColor: isDarkTheme ? Colors.grey.shade400 : Colors.grey.shade700,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: isDarkTheme ? Colors.white : Colors.black,
        selectionColor: Colors.blue,
      ),
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: isDarkTheme ? Colors.white : Colors.black,
            displayColor: isDarkTheme ? Colors.white : Colors.black,
          ),
      cardColor: isDarkTheme ? darkCardColor : lightCardColor,
      colorScheme: ThemeData().colorScheme.copyWith(
            onSecondary: isDarkTheme ? darkCardColor : lightCardColor,
            primary: isDarkTheme ? darkCardColor : lightCardColor,
            background:
                isDarkTheme ? darkBackgroundColor : lightBackgroundColor,
          ),
    );
  }
}
