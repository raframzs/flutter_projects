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
  String content;
  DateTime created;
  String curse;
  int dislikes;
  int likes;
  String title;
  String? user;

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

  static bool isOkBlog(Blog blog) {
    return _validString(blog.content, 80) &&
        _validString(blog.title, 10) &&
        _validString(blog.user, 1) &&
        _validString(blog.curse, 1);
  }

  static bool _validString(String? txt, int minlen) {
    return txt != null && txt.length > minlen;
  }
}
