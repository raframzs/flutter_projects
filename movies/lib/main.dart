import 'package:flutter/material.dart';
import 'package:movies/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomeScreen(),
        'details': (context) => const DetailsScreen()
      },
      theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(elevation: 0, color: Colors.indigo)),
    );
  }
}
