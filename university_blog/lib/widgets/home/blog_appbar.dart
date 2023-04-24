import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_blog/providers/providers.dart';
import 'package:university_blog/theme/app_theme.dart';

class BlogAppBar extends StatelessWidget with PreferredSizeWidget {
  const BlogAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    BlogsProvider blogsProvider = Provider.of<BlogsProvider>(context);
    UsersProvider usersProvider = Provider.of<UsersProvider>(context);
    return AppBar(
      title: Row(
        children: const [
          Icon(
            Icons.chat,
            size: 35,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'UNI',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          Text(
            'BLOG',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22),
          )
        ],
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color.fromARGB(255, 225, 40, 62),
                Color(0xffe2001a)
              ]),
        ),
      ),
      actions: [
        PopupMenuButton(itemBuilder: (context) {
          return [
            PopupMenuItem<int>(
              value: 0,
              child: Row(
                children: const [
                  Icon(
                    Icons.star,
                    color: AppTheme.primary,
                  ),
                  SizedBox(width: 5),
                  Text("Blogs Populares"),
                ],
              ),
            ),
            PopupMenuItem<int>(
              value: 1,
              child: Row(
                children: const [
                  Icon(
                    Icons.logout_outlined,
                    color: Colors.black,
                  ),
                  SizedBox(width: 5),
                  Text('Salir')
                ],
              ),
            ),
          ];
        }, onSelected: (value) {
          if (value == 0) {
            blogsProvider.sortBlogsByPopular();
          } else if (value == 1) {
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
