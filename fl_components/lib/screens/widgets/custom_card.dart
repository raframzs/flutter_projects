import 'package:flutter/material.dart';

import '../../models/app_theme.dart';

class CustomCardScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  const CustomCardScreen(
      {Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.abc,
              color: AppTheme.primary,
            ),
            title: Text(title),
            subtitle: Text(subtitle),
          )
        ],
      ),
    );
  }
}
