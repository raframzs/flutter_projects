import 'package:flutter/material.dart';

class LocationPoint extends StatelessWidget {
  const LocationPoint({
    super.key,
    required this.value,
    required this.label,
  });

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 15, color: Colors.grey.shade800),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(value, style: const TextStyle(fontSize: 25))
      ],
    );
  }
}
