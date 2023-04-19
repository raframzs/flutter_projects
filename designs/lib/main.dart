import 'package:designs/screens/basic_design.dart';
import 'package:designs/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/scroll_design.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home-screen',
      routes: {
        'basic-design': (_) => const BasicDesignScreen(),
        'scroll-design': (_) => const ScrollScreen(),
        'home-screen': (_) => const HomeScreen(),
      },
    );
  }
}
