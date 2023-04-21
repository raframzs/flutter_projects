import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:university_blog/providers/blogs_provider.dart';
import 'package:university_blog/theme/app_theme.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BlogsProvider provider = Provider.of<BlogsProvider>(context);
    return Scaffold(
        appBar: const BlogAppBar(),
        floatingActionButton: const _UserActionsButton(),
        body: FutureBuilder(
          future: provider.getBlogs(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return const HomeBackground(
                  iconsColor: Colors.black12,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator(
                      strokeWidth: 10,
                      color: AppTheme.primary,
                    ),
                  ));
            }

            return HomeBackground(
                iconsColor: AppTheme.primary,
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      BlogCard(),
                      BlogCard(),
                      BlogCard(),
                      BlogCard(),
                    ],
                  ),
                ));
          },
        ));
  }
}

class _UserActionsButton extends StatefulWidget {
  const _UserActionsButton();

  @override
  State<_UserActionsButton> createState() => _UserActionsButtonState();
}

class _UserActionsButtonState extends State<_UserActionsButton> {
  @override
  Widget build(BuildContext context) {
    return CircularMenu(
        alignment: Alignment.bottomRight,
        toggleButtonColor: AppTheme.primary,
        animationDuration: const Duration(milliseconds: 800),
        toggleButtonIconColor: Colors.white,
        toggleButtonMargin: 10.0,
        toggleButtonSize: 50.0,
        items: [
          CircularMenuItem(
              icon: Icons.add,
              color: AppTheme.primary,
              onTap: () {
                setState(() {
                  Navigator.pushNamed(context, 'create');
                });
              }),
          CircularMenuItem(
              icon: Icons.search,
              color: AppTheme.primary,
              onTap: () {
                setState(() {
                  Navigator.pushNamed(context, 'search');
                });
              }),
          CircularMenuItem(
              icon: Icons.dark_mode,
              color: AppTheme.primary,
              onTap: () {
                setState(() {});
              })
        ]);
  }
}
