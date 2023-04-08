import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:sismos_app/models/event.dart';
import 'package:sismos_app/provider/sismos_provider.dart';

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
          title: const Text('Últimos Sismos'),
          elevation: 0,
          backgroundColor: Colors.amber.shade600,
        ),
        body: FutureBuilder(
          future: provider.getEvents(),
          builder: (_, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.amber.shade600,
                ),
              );
            }
            List<Event> events = snapshot.data!;
            return ListView.builder(
              itemCount: events.length,
              itemBuilder: (_, index) {
                final Event event = events[index];
                var date = DateFormat.yMMMMd().format(event.localDate);
                return Container(
                  width: double.infinity,
                  height: 200,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 110,
                            height: 180,
                            child: Column(children: [
                              SizedBox(
                                width: 110,
                                height: 90,
                                child: Column(children: [
                                  SizedBox(
                                    width: 110,
                                    height: 70,
                                    child: Text(
                                      '${event.magnitude.value}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 60),
                                    ),
                                  ),
                                  Text(
                                    'MAGNITUD',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey.shade800),
                                  )
                                ]),
                              ),
                              SizedBox(
                                  width: 110,
                                  height: 90,
                                  child: Column(children: [
                                    SizedBox(
                                      width: 110,
                                      height: 70,
                                      child: Text(
                                        '${event.depth}',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(fontSize: 60),
                                      ),
                                    ),
                                    Text(
                                      'PROFUNDIDAD',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey.shade800),
                                    )
                                  ])),
                            ]),
                          ),
                          SizedBox(
                              width: 110,
                              height: 180,
                              child: Column(children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 110,
                                  height: 90,
                                  child: Column(children: [
                                    const SizedBox(
                                      width: 110,
                                      height: 40,
                                      child: FadeInImage(
                                        image:
                                            AssetImage('assets/map_icon.png'),
                                        placeholder:
                                            AssetImage('assets/not_found.png'),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'MAPA',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey.shade800),
                                    )
                                  ]),
                                ),
                                SizedBox(
                                    width: 110,
                                    height: 80,
                                    child: Column(children: [
                                      SizedBox(
                                        width: 110,
                                        height: 50,
                                        child: Icon(
                                          Icons.info,
                                          size: 50,
                                          color: Colors.blue.shade700,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'INFO',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.grey.shade800),
                                      )
                                    ])),
                              ])),
                          Column(
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'LATITUD',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey.shade800),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text('${event.latitude}',
                                      style: const TextStyle(fontSize: 25))
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'LONGITUD',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey.shade800),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text('${event.longitude}',
                                      style: const TextStyle(fontSize: 25)),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text(date,
                                      style: const TextStyle(fontSize: 25))
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Text(event.geoReference,
                                      maxLines: 3,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.indigo,
                                      ))
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 2,
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
