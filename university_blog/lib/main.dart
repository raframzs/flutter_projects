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
      providers: [
        ChangeNotifierProvider(create: (context) => AppTheme()),
        ChangeNotifierProvider(
          create: (context) => UsersProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
            create: (context) => TeachersProvider(), lazy: false),
        ChangeNotifierProvider(
            create: (context) => CursesProvider(), lazy: false),
        ChangeNotifierProvider(create: (context) => BlogsProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = Provider.of<AppTheme>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme.currentTheme,
      initialRoute: Routes.loginScreen,
      routes: {
        Routes.homeScreen: (context) => const HomeScreen(),
        Routes.loginScreen: (context) => const LoginScreen(),
        Routes.createScreen: (context) => const CreateBlogScreen(),
        Routes.searchScreen: (context) => const SearchScreen(),
      },
    );
  }
}
