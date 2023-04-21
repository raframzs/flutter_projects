import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_blog/providers/blogs_provider.dart';
import 'package:university_blog/theme/app_theme.dart';

import 'screens/screens.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BlogsProvider(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getTheme(),
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomeScreen(),
        'login': (context) => const LoginScreen(),
        'create': (context) => const CreateBlogScreen(),
        'search': (context) => const SearchScreen(),
      },
    );
  }
}
