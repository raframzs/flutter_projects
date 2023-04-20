import 'package:flutter/material.dart';

class InputDecorations {
  static Color university = const Color(0xffe2001a);
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    required IconData icon,
  }) {
    return InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: university)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: university)),
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(
          icon,
          color: university,
        ));
  }
}
