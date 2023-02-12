import 'package:flutter/material.dart';

class AppTheme {
  static const primary = Colors.red;
  static const secondaryColor = Colors.black;

  static ThemeData getTheme() {
    return ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ));
  }
}
