import 'package:flutter/material.dart';

class AppTheme extends ChangeNotifier {
  static const primary = Color(0xffe2001a);

  ThemeData currentTheme = lightTheme();

  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
        primaryColor: primary,
        appBarTheme: const AppBarTheme(
          color: primary,
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.grey[300]);
  }
}
