import 'package:flutter/material.dart';

class AppBarImage extends StatelessWidget {
  const AppBarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: double.infinity,
        height: 240,
        child: FadeInImage(
          image: NetworkImage(
              'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/783b9a46-3385-4b55-bb9c-3738fe8b3025/ddreuv8-0e60588a-27fd-4415-9443-5ac7bbe50097.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzc4M2I5YTQ2LTMzODUtNGI1NS1iYjljLTM3MzhmZThiMzAyNVwvZGRyZXV2OC0wZTYwNTg4YS0yN2ZkLTQ0MTUtOTQ0My01YWM3YmJlNTAwOTcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0._SiYEjTA7Ok3FTFCZ8gG5mMU0ZlCtsQevfRFPQArK0k'),
          placeholder: AssetImage('assets/thumbail.jpeg'),
        ));
  }
}
