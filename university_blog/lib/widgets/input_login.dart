import 'package:flutter/material.dart';

class InputLoginScreen extends StatelessWidget {
  final String name;
  final bool? obscureText;
  const InputLoginScreen({Key? key, required this.name, this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        obscureText: obscureText ?? false,
        scrollPadding: const EdgeInsets.only(bottom: 220),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(90.0),
          ),
          labelText: name,
        ),
      ),
    );
  }
}
