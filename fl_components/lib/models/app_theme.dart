import 'package:flutter/material.dart';

class AppTheme {
  static final primary = Colors.blue[500];

  static ThemeData getTheme() {
    return ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
      color: primary,
      elevation: 0,
    ));
  }
}
