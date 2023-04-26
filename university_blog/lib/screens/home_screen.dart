import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BlogsProvider provider = Provider.of<BlogsProvider>(context);
    final AppTheme appTheme = Provider.of<AppTheme>(context);
    if (provider.isLoading) {
      return HomeBackground(
          firstIcon: Icons.cloud_circle,
          isLoading: true,
          child: SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(
              strokeWidth: 10,
              color: appTheme.loading,
            ),
          ));
    }

    return Scaffold(
        appBar: const BlogAppBar(),
        floatingActionButton: const _UserActionsButton(),
        body: HomeBackground(
            firstIcon: Icons.chat,
            isLoading: false,
            child: RefreshIndicator(
              onRefresh: () async {
                provider.getBlogs();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children:
                      provider.blogs.map((e) => BlogCard(blog: e)).toList(),
                ),
              ),
            )));
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
    AppTheme themProvider = Provider.of<AppTheme>(context);
    return CircularMenu(
        alignment: Alignment.bottomRight,
        toggleButtonColor: themProvider.buttonColor,
        animationDuration: const Duration(milliseconds: 800),
        toggleButtonIconColor: Colors.white,
        toggleButtonMargin: 10.0,
        toggleButtonSize: 50.0,
        items: [
          CircularMenuItem(
              icon: Icons.add,
              color: themProvider.buttonColor,
              onTap: () {
                setState(() {
                  Navigator.pushNamed(context, Routes.createScreen);
                });
              }),
          CircularMenuItem(
              icon: Icons.search,
              color: themProvider.buttonColor,
              onTap: () {
                setState(() {
                  Navigator.pushNamed(context, Routes.searchScreen);
                });
              }),
          CircularMenuItem(
              icon: Icons.dark_mode,
              color: themProvider.switchThemeButton,
              onTap: () {
                themProvider.swtichTheme();
                setState(() {});
              })
        ]);
  }
}
