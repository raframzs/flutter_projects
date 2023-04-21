import 'package:flutter/material.dart';

class BlogAppBar extends StatelessWidget with PreferredSizeWidget {
  const BlogAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: const [
          Icon(
            Icons.chat,
            size: 30,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'UNI',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'BLOG',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
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
        PopupMenuButton(
            // add icon, by default "3 dot" icon
            // icon: Icon(Icons.book)
            itemBuilder: (context) {
          return [
            PopupMenuItem<int>(
              value: 0,
              child: Row(
                children: const [
                  Icon(
                    Icons.bar_chart_sharp,
                    color: Colors.black,
                  ),
                  SizedBox(width: 5),
                  Text("Mejores Docentes"),
                ],
              ),
            ),
            PopupMenuItem<int>(
              value: 1,
              child: Row(
                children: const [
                  Icon(
                    Icons.logout_outlined,
                    color: Color(0xffe2001a),
                  ),
                  SizedBox(width: 5),
                  Text('Salir')
                ],
              ),
            ),
          ];
        }, onSelected: (value) {
          if (value == 0) {
            print("My account menu is selected.");
          } else if (value == 1) {
            print("Settings menu is selected.");
          } else if (value == 2) {
            print("Logout menu is selected.");
          }
        }),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}