import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        _Button(
          icon: Icons.call,
          label: 'CALL',
        ),
        _Button(
          icon: Icons.route,
          label: 'ROUTE',
        ),
        _Button(
          icon: Icons.share,
          label: 'SHARE',
        ),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 50,
          color: Colors.red,
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.red),
        )
      ],
    );
  }
}
