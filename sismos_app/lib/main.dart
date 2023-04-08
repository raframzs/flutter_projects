import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:sismos_app/models/event.dart';
import 'package:sismos_app/provider/sismos_provider.dart';
import 'package:sismos_app/theme/app_theme.dart';

import 'screens/recent_earthquakes.dart';

void main() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SismosProvider(),
          lazy: false,
        )
      ],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final SismosProvider provider = Provider.of<SismosProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Últimos Sismos: '),
                  Text(
                    'CHILE',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'By Rafael Ramirez',
                    style: TextStyle(
                        fontSize: 13,
                        letterSpacing: 2,
                        color: Colors.grey.shade300),
                  )
                ],
              )
            ],
          ),
          elevation: 0,
          backgroundColor: AppTheme.primary,
        ),
        body: FutureBuilder(
          future: provider.getEvents(),
          builder: (_, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppTheme.primary,
                ),
              );
            }
            List<Event> events = snapshot.data!;
            return RecentEarthquakes(events: events);
          },
        ),
      ),
    );
  }
}
