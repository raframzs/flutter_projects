import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_blog/providers/providers.dart';
import 'package:university_blog/theme/app_theme.dart';
import 'package:university_blog/ui/separators.dart';

class BlogAppBar extends StatelessWidget with PreferredSizeWidget {
  const BlogAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    BlogsProvider blogsProvider = Provider.of<BlogsProvider>(context);
    UsersProvider usersProvider = Provider.of<UsersProvider>(context);
    AppTheme appTheme = Provider.of<AppTheme>(context);
    return AppBar(
      title: GestureDetector(
        onTap: () => blogsProvider.getBlogs(),
        child: Row(
          children: [
            Icon(
              Icons.chat,
              size: 35,
              color: appTheme.appBarLogoIcon,
            ),
            Separators.separatorH(5),
            const Text(
              'UNI',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              'BLOG',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: appTheme.appBarLogoColor,
                  fontSize: 22),
            )
          ],
        ),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: appTheme.appBarBackground),
        ),
      ),
      actions: [
        PopupMenuButton(
            color: appTheme.appBarMenu,
            itemBuilder: (context) {
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: appTheme.appBarMenuIcon,
                      ),
                      Separators.separatorH(5),
                      Text(
                        "Blogs Populares",
                        style: TextStyle(color: appTheme.appBarMenuText),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: appTheme.appBarMenuIcon,
                      ),
                      Separators.separatorH(5),
                      Text('Acerca De',
                          style: TextStyle(color: appTheme.appBarMenuText))
                    ],
                  ),
                ),
                PopupMenuItem<int>(
                  value: 2,
                  child: Row(
                    children: [
                      Icon(
                        Icons.attach_money_sharp,
                        color: appTheme.appBarLogoColor,
                      ),
                      Separators.separatorH(5),
                      Text('Hacer una Donación',
                          style: TextStyle(color: appTheme.appBarMenuText))
                    ],
                  ),
                ),
                PopupMenuItem<int>(
                  value: 3,
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout_outlined,
                        color: appTheme.appBarLogoColor,
                      ),
                      Separators.separatorH(5),
                      Text('Salir',
                          style: TextStyle(color: appTheme.appBarMenuText))
                    ],
                  ),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                blogsProvider.sortBlogsByPopular();
              } else if (value == 1) {
                Navigator.pushNamed(context, Routes.aboutScreen);
              } else if (value == 2) {
                Navigator.pushNamed(context, Routes.donate);
              } else if (value == 3) {
                usersProvider.logout();
                Navigator.pushNamed(context, Routes.loginScreen);
              }
            }),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
