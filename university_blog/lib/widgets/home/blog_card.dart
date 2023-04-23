import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

import 'package:university_blog/models/models.dart';
import 'package:university_blog/providers/providers.dart';
import 'package:university_blog/theme/app_theme.dart';
import 'package:university_blog/ui/separators.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({
    super.key,
    required this.blog,
  });
  final Blog blog;

  @override
  Widget build(BuildContext context) {
    final UsersProvider usersProvider = Provider.of<UsersProvider>(context);
    final CursesProvider cursesProvider = Provider.of<CursesProvider>(context);
    final TeachersProvider teachersProvider =
        Provider.of<TeachersProvider>(context);
    Curse curse = cursesProvider.getCurse(blog.curse);
    return Container(
      margin: const EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: const Color.fromARGB(179, 255, 255, 255),
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 5))
                ]),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // NickName
              Row(
                children: [
                  const Icon(
                    Icons.alternate_email_sharp,
                    color: AppTheme.primary,
                  ),
                  Separators.separatorH(5),
                  Text(
                    usersProvider.getName(blog.user),
                  )
                ],
              ),
              Separators.separatorV(10),
              // Title
              Text(
                blog.title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
              Separators.separatorV(10),
              Text(
                blog.content,
                style: const TextStyle(color: Colors.black54),
              ),
              Separators.separatorV(10),
              Row(
                children: [
                  const Text(
                    'Curso: ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Separators.separatorH(5),
                  Text(curse.name),
                ],
              ),

              Row(
                children: [
                  const Text(
                    'Docente: ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  Separators.separatorH(5),
                  Text(teachersProvider.getName(curse.teacher)),
                ],
              ),
              Row(
                children: [
                  const Spacer(),
                  LikeButton(
                      circleColor: const CircleColor(
                          start: AppTheme.primary, end: AppTheme.primary),
                      bubblesColor: const BubblesColor(
                        dotPrimaryColor: AppTheme.primary,
                        dotSecondaryColor: AppTheme.primary,
                      ),
                      likeCount: blog.likes,
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          Icons.favorite,
                          color: isLiked ? AppTheme.primary : Colors.grey,
                          size: 25,
                        );
                      }),
                  Separators.separatorH(10),
                  LikeButton(
                      size: 25,
                      circleColor: const CircleColor(
                          start: Colors.deepPurpleAccent,
                          end: Colors.deepPurpleAccent),
                      bubblesColor: const BubblesColor(
                        dotPrimaryColor: Colors.deepPurpleAccent,
                        dotSecondaryColor: Colors.deepPurpleAccent,
                      ),
                      likeCount: blog.dislikes,
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          Icons.heart_broken,
                          color:
                              isLiked ? Colors.deepPurpleAccent : Colors.grey,
                          size: 25,
                        );
                      }),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
