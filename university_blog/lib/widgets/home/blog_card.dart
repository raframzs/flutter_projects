import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:university_blog/theme/app_theme.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12, blurRadius: 8, offset: Offset(0, 5))
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // NickName
          Row(
            children: const [
              Icon(
                Icons.alternate_email_sharp,
                color: AppTheme.primary,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'rafaela-ramirezs',
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          // Title
          const Text(
            'Excelente curso y excelente docente',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Consectetur ex ut excepteur dolor minim esse culpa aute mollit consectetur est ea. Pariatur cupidatat Lorem non esse sit veniam in in quis. Exercitation anim irure minim voluptate ex pariatur proident ipsum. Lorem nostrud officia dolore veniam occaecat. Dolor commodo ad occaecat incididunt consequat duis do. Proident labore incididunt et nulla aliquip sunt ullamco id veniam consectetur.',
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text('Abril 21, 2023'),
              const Spacer(),
              LikeButton(
                  circleColor:
                      const CircleColor(start: Colors.red, end: Colors.red),
                  bubblesColor: const BubblesColor(
                    dotPrimaryColor: Colors.red,
                    dotSecondaryColor: Colors.red,
                  ),
                  likeCount: 200,
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.favorite,
                      color: isLiked ? Colors.red : Colors.grey,
                      size: 25,
                    );
                  }),
              const SizedBox(
                width: 10,
              ),
              LikeButton(
                  size: 25,
                  circleColor: const CircleColor(
                      start: Colors.deepPurpleAccent,
                      end: Colors.deepPurpleAccent),
                  bubblesColor: const BubblesColor(
                    dotPrimaryColor: Colors.deepPurpleAccent,
                    dotSecondaryColor: Colors.deepPurpleAccent,
                  ),
                  likeCount: 1,
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.heart_broken,
                      color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
                      size: 25,
                    );
                  }),
            ],
          )
        ]),
      ),
    );
  }
}
