import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.value,
    required this.label,
  });

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 90,
      child: Column(children: [
        SizedBox(
          width: 110,
          height: 70,
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: AppTheme.inicatorStyle,
          ),
        ),
        Text(
          label,
          style: AppTheme.labelStyle,
        )
      ]),
    );
  }
}
