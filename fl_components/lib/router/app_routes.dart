import 'package:fl_components/models/models.dart';
import 'package:fl_components/screens/screens.dart';

import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const HomeScreen());
  }

  static List<MenuOption> menuOptions = <MenuOption>[
    MenuOption(
        route: 'home',
        icon: Icons.home,
        name: 'Home',
        screen: const HomeScreen()),
    MenuOption(
        route: 'listview1',
        icon: Icons.list,
        name: 'Lista de Items 1',
        screen: ListView1Screen()),
    MenuOption(
        route: 'listview2',
        icon: Icons.list_outlined,
        name: 'Lista de Items 2',
        screen: ListView2Screen()),
    MenuOption(
        route: 'cards',
        icon: Icons.card_giftcard,
        name: 'Cards',
        screen: const CardScreen()),
    MenuOption(
        route: 'alert',
        icon: Icons.lock_clock,
        name: 'Alerta',
        screen: const AlertScreen())
  ];

  static Map<String, Widget Function(BuildContext)> getMenuRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};
    for (final option in menuOptions) {
      routes.addAll({option.route: (BuildContext ctx) => option.screen});
    }
    return routes;
  }
}
