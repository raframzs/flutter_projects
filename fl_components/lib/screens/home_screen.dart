import 'package:fl_components/models/app_theme.dart';
import 'package:fl_components/router/app_routes.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static final routes = AppRoutes.menuOptions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Componentes en Flutter'),
        ),
        body: ListView.separated(
            itemBuilder: (_, index) => ListTile(
                  leading: Icon(
                    routes[index].icon,
                    color: AppTheme.primary,
                  ),
                  title: Text(routes[index].name),
                  onTap: () {
                    Navigator.pushNamed(context, routes[index].route);
                  },
                ),
            separatorBuilder: (_, index) => const Divider(),
            itemCount: routes.length));
  }
}
