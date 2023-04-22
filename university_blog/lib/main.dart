import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_blog/theme/app_theme.dart';

import 'providers/providers.dart';
import 'screens/screens.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => BlogsProvider())],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getTheme(),
      initialRoute: Routes.homeScreen,
      routes: {
        Routes.homeScreen: (context) => const HomeScreen(),
        Routes.loginScreen: (context) => const LoginScreen(),
        Routes.createScreen: (context) => const CreateBlogScreen(),
        Routes.searchScreen: (context) => const SearchScreen(),
      },
    );
  }
}
