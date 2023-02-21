import 'package:flutter/material.dart';

class AppTheme {
  static final primary = Colors.cyanAccent[700];

  static ThemeData getTheme() {
    return ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
      color: primary,
      elevation: 0,
    ));
  }
}
