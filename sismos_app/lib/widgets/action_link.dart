import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_theme.dart';

class ActionLink extends StatelessWidget {
  const ActionLink({
    super.key,
    required this.icon,
    required this.label,
    required this.url,
  });

  final IconData icon;
  final String label;
  final Uri url;

  Future<void> _launchUrl() async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 90,
      child: Column(children: [
        SizedBox(
          width: 110,
          height: 40,
          child: IconButton(
            icon: label == 'MAPA'
                ? Flag.fromCode(
                    FlagsCode.CL,
                    width: 35,
                    fit: BoxFit.fill,
                  )
                : Icon(
                    icon,
                    color: AppTheme.primary,
                    size: 50,
                  ),
            onPressed: _launchUrl,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          label,
          style: AppTheme.labelStyle,
        )
      ]),
    );
  }
}
