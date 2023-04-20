import 'package:flutter/material.dart';

class AppTheme {
  static const primary = Color(0xffe2001a);

  static ThemeData getTheme() {
    return ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: primary,
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.grey[300]);
  }
}
