import 'dart:convert';

import 'package:university_blog/models/models.dart';

class BlogsResponse {
  BlogsResponse({
    required this.id,
    required this.status,
    required this.resource,
    required this.data,
  });

  String id;
  int status;
  String resource;
  List<Blog> data;

  factory BlogsResponse.fromRawJson(String str) =>
      BlogsResponse.fromJson(json.decode(str));

  factory BlogsResponse.fromJson(Map<String, dynamic> json) => BlogsResponse(
        id: json["id"],
        status: json["status"],
        resource: json["resource"],
        data: List<Blog>.from(json["data"].map((x) => Blog.fromJson(x))),
      );
}

class Blog {
  Blog({
    required this.id,
    required this.created,
    required this.content,
    required this.user,
    required this.curse,
    required this.stats,
  });

  int id;
  DateTime created;
  String content;
  User user;
  Curse curse;
  Stats stats;

  factory Blog.fromRawJson(String str) => Blog.fromJson(json.decode(str));

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        id: json["id"],
        created: DateTime.parse(json["created"]),
        content: json["content"],
        user: User.fromJson(json["user"]),
        curse: Curse.fromJson(json["curse"]),
        stats: Stats.fromJson(json["stats"]),
      );
}
