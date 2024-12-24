import 'package:flutter/material.dart';

Color lightPrimary = const Color(0xFF687daf);
Color darkPrimary = const Color(0xFF50577A);

class Styles {
  static ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimary,
    scaffoldBackgroundColor: const Color(0xFFeeedf2), // Màu nền cho light theme
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF3b3b3b), fontWeight: FontWeight.w500),
      headlineLarge: TextStyle(fontSize: 26, color: Color(0xFF3b3b3b), fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(fontSize: 21, color: Color(0xFF3b3b3b), fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      labelSmall: TextStyle(fontSize: 14, color: Color(0xFF9E9E9E), fontWeight: FontWeight.w500),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: darkPrimary,
    scaffoldBackgroundColor: const Color(0xFF121212), // Màu nền cho dark theme
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, color: Color(0xFFF1F1F1), fontWeight: FontWeight.w500),
      headlineLarge: TextStyle(fontSize: 26, color: Color(0xFFF1F1F1), fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(fontSize: 21, color: Color(0xFFF1F1F1), fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      labelSmall: TextStyle(fontSize: 14, color: Color(0xFF757575), fontWeight: FontWeight.w500),
    ),
  );

  // Định nghĩa các TextStyle cần thiết
  static TextStyle headLineStyle1 = TextStyle(
    fontSize: 26,
    color: lightPrimary, // Điều chỉnh màu sắc nếu cần
    fontWeight: FontWeight.bold,
  );

  static TextStyle headLineStyle2 = TextStyle(
    fontSize: 21,
    color: lightPrimary, // Điều chỉnh màu sắc nếu cần
    fontWeight: FontWeight.bold,
  );

  static TextStyle headLineStyle3 = TextStyle(
    fontSize: 17,
    color: lightPrimary, // Điều chỉnh màu sắc nếu cần
    fontWeight: FontWeight.w500,
  );

  static TextStyle headLineStyle4 = TextStyle(
    fontSize: 14,
    color: Colors.grey.shade500,
    fontWeight: FontWeight.w500,
  );

  static TextStyle textStyle = TextStyle(
    fontSize: 16,
    color: const Color(0xFF3b3b3b),
    fontWeight: FontWeight.w500,
  );

  static Color primaryColor = lightPrimary;

  static Color orangeColor = const Color(0xFFF37b67);
  
  static Color kakiColor = const Color(0xFFd2bdb6);

}