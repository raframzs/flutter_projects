import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final double height;
  final double width;
  final EdgeInsetsGeometry? padding;
  final Function()? onPressed;
  const Button({
    super.key,
    required this.height,
    required this.width,
    this.padding,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        padding: padding,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.red),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ))),
          onPressed: onPressed,
          child: const Text('Log In'),
        ));
  }
}
