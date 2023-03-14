import 'package:flutter/material.dart';

class AppTheme {
  static final primary = Colors.blue[500];

  static ThemeData getTheme() {
    return ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: primary,
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: primary),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primary!),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primary!),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10))),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10))),
        ));
  }
}
