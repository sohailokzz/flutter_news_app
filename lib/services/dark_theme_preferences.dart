import 'package:shared_preferences/shared_preferences.dart';

class ThemePrefernces {
  static const themeStatus = 'THEME_STATUS';

  setDarkTheme(bool value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(
      themeStatus,
      value,
    );
  }

  Future<bool> getTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(
          themeStatus,
        ) ??
        false;
  }
}
