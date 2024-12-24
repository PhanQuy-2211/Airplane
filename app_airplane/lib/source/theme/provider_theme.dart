import 'package:app_airplane/source/utils/app_styles.dart';
import 'package:flutter/material.dart';
 // Import Light/Dark Mode từ Styles

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = Styles.lightTheme; // Mặc định Light Mode

  ThemeData get themeData => _themeData;

  void toggleTheme() {
    _themeData = _themeData == Styles.lightTheme ? Styles.darkTheme : Styles.lightTheme;
    notifyListeners();
  }
}