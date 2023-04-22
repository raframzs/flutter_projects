import 'dart:convert';

class Blog {
  Blog(
      {required this.content,
      required this.created,
      required this.curse,
      required this.dislikes,
      required this.likes,
      required this.title,
      required this.user,
      this.id});
  String? id;
  final String content;
  final DateTime created;
  final String curse;
  final int dislikes;
  final int likes;
  final String title;
  final String user;

  factory Blog.fromRawJson(String str) => Blog.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        content: json["content"],
        created: DateTime.parse(json["created"]),
        curse: json["curse"],
        dislikes: json["dislikes"],
        likes: json["likes"],
        title: json["title"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "created": created.toIso8601String(),
        "curse": curse,
        "dislikes": dislikes,
        "likes": likes,
        "title": title,
        "user": user,
      };
}
