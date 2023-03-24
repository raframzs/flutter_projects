import 'dart:convert';

import 'package:university_blog/models/models.dart';

class Curse {
  Curse({
    required this.id,
    required this.created,
    required this.name,
    required this.program,
    required this.teachers,
  });

  int id;
  DateTime created;
  String name;
  String program;
  List<Teacher> teachers;

  factory Curse.fromRawJson(String str) => Curse.fromJson(json.decode(str));

  factory Curse.fromJson(Map<String, dynamic> json) => Curse(
        id: json["id"],
        created: DateTime.parse(json["created"]),
        name: json["name"],
        program: json["program"],
        teachers: List<Teacher>.from(
            json["teachers"].map((x) => Teacher.fromJson(x))),
      );
}
