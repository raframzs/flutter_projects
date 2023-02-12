import 'package:fl_components/models/models.dart';
import 'package:fl_components/router/app_routes.dart';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRoutes.initialRoute, // default route
      routes: AppRoutes.getMenuRoutes(), // list of routes
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: AppTheme.getTheme(), // if wrong route
    );
  }
}
