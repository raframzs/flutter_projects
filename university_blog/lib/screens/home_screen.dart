import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../providers/providers.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BlogsProvider provider = Provider.of<BlogsProvider>(context);
    if (provider.isLoading) {
      return const HomeBackground(
          firstIcon: Icons.cloud_circle,
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

    return Scaffold(
        appBar: const BlogAppBar(),
        floatingActionButton: const _UserActionsButton(),
        body: HomeBackground(
            firstIcon: Icons.chat,
            iconsColor: AppTheme.primary,
            child: SingleChildScrollView(
              child: Column(
                children: _loadBlogs(provider),
              ),
            )));
  }

  List<BlogCard> _loadBlogs(BlogsProvider provider) {
    List<Blog> blogsSorted = provider.blogs;
    blogsSorted.sort((a, b) => a.created.compareTo(b.created));
    return blogsSorted.reversed.toList().map((e) => BlogCard(blog: e)).toList();
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
                  Navigator.pushNamed(context, Routes.createScreen);
                });
              }),
          CircularMenuItem(
              icon: Icons.search,
              color: AppTheme.primary,
              onTap: () {
                setState(() {
                  Navigator.pushNamed(context, Routes.searchScreen);
                });
              }),
          CircularMenuItem(
              icon: Icons.dark_mode,
              color: Colors.blue.shade900,
              onTap: () {
                setState(() {});
              })
        ]);
  }
}
