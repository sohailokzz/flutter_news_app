import 'package:flutter/material.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class Utilis {
  BuildContext context;

  Utilis(this.context);

  bool get getTheme => Provider.of<ThemeProvider>(context).getDarkTheme;

  Color get getColor => getTheme ? Colors.white : Colors.black;
}