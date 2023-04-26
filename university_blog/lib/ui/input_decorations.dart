import 'package:flutter/material.dart';

class InputDecorations {
  static Color university = const Color(0xffe2001a);
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    required IconData icon,
    required Color color,
  }) {
    return InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: color)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: color)),
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(
          icon,
          color: color,
        ));
  }

  static InputDecoration createInputDecoration({
    required String hintText,
    required String labelText,
    required IconData icon,
    required Color iconColor,
  }) {
    return InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(color: iconColor),
        prefixIcon: Icon(
          icon,
          color: iconColor,
          size: 30,
        ));
  }
}
