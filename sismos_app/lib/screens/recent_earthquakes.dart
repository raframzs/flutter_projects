import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class RecentEarthquakes extends StatelessWidget {
  const RecentEarthquakes({
    super.key,
    required this.events,
  });

  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (_, index) {
        final Event event = events[index];
        return Container(
          width: double.infinity,
          height: 200,
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: _EarthquakeCard(event: event),
        );
      },
    );
  }
}

class _EarthquakeCard extends StatelessWidget {
  const _EarthquakeCard({
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _Indicators(event: event),
            _LinksTo(event: event),
            Data(event: event),
          ],
        ),
        const Divider(
          thickness: 2,
        )
      ],
    );
  }
}

class _LinksTo extends StatelessWidget {
  const _LinksTo({
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 110,
        height: 180,
        child: Column(children: [
          ActionLink(
            icon: Icons.map,
            label: 'MAPA',
            url: event.mapUri,
          ),
          ActionLink(
            icon: Icons.info,
            label: 'INFO',
            url: event.urlUri,
          ),
        ]));
  }
}

class _Indicators extends StatelessWidget {
  const _Indicators({
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 180,
      child: Column(children: [
        Indicator(
          value: '${event.magnitude.value}',
          label: 'MAGNITUD',
        ),
        Indicator(
          value: '${event.depth}',
          label: 'PROFUNDIDAD',
        ),
      ]),
    );
  }
}
