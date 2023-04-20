import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class BlogFeed extends StatelessWidget {
  final String url;
  final String userName;
  final String userNick;
  final String content;
  final String curse;
  final String teacher;
  final int likes;
  final int dislikes;

  const BlogFeed({
    super.key,
    required this.url,
    required this.userName,
    required this.userNick,
    required this.content,
    required this.curse,
    required this.teacher,
    required this.likes,
    required this.dislikes,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              maxRadius: 25,
              backgroundImage: NetworkImage(url),
            ),
            title: Row(children: [
              Text(userName),
              const SizedBox(
                width: 10,
              ),
              const Text(
                '@',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 20),
              ),
              Text(userNick)
            ]),
            subtitle:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(content),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Icon(
                    Icons.class_outlined,
                  ),
                  Text(
                    curse,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
              Row(
                children: [const SizedBox(width: 25), Text(teacher)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  LikeButton(
                      circleColor:
                          const CircleColor(start: Colors.red, end: Colors.red),
                      bubblesColor: const BubblesColor(
                        dotPrimaryColor: Colors.red,
                        dotSecondaryColor: Colors.red,
                      ),
                      likeCount: likes,
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
                      likeCount: dislikes,
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          Icons.heart_broken,
                          color:
                              isLiked ? Colors.deepPurpleAccent : Colors.grey,
                          size: 25,
                        );
                      }),
                  const SizedBox(
                    width: 10,
                  )
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
