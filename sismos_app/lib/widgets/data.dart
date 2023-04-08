import 'package:flutter/material.dart';
import 'package:sismos_app/theme/app_theme.dart';

import '../models/models.dart';
import 'widgets.dart';

class Data extends StatelessWidget {
  const Data({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LocationPoint(
          label: 'LATITUD',
          value: '${event.latitude}',
        ),
        const SizedBox(
          height: 5,
        ),
        LocationPoint(
          label: 'LONGITUD',
          value: '${event.longitude}',
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              'FECHA',
              style: TextStyle(fontSize: 15, color: Colors.grey.shade800),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(event.utcDate.toString().substring(0, 10),
                style: TextStyle(fontSize: 20, color: AppTheme.primary))
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        LocationPoint(
          label: 'HORAS',
          value: event.utcDate.toString().substring(10, 16),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(event.geoReference,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              fontSize: 13,
              color: AppTheme.primary,
            ))
      ],
    );
  }
}
