import 'package:flutter/material.dart';

import '../models/models.dart';
import 'widgets.dart';

class Data extends StatelessWidget {
  const Data({
    super.key,
    required this.event,
    required this.date,
  });

  final Event event;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        LocationPoint(
          label: 'LATITUD',
          value: '${event.latitude}',
        ),
        const SizedBox(
          height: 15,
        ),
        LocationPoint(
          label: 'LONGITUD',
          value: '${event.longitude}',
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [Text(date, style: const TextStyle(fontSize: 25))],
        ),
        const SizedBox(
          height: 15,
        ),
        Text(event.geoReference,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.indigo,
            ))
      ],
    );
  }
}
