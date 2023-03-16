import 'package:flutter/material.dart';
import 'package:university_blog/screens/login.dart';
import 'package:university_blog/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getTheme(),
        home: const Scaffold(resizeToAvoidBottomInset: true, body: Login()));
  }
}
