import 'dart:convert';

class Curse {
  Curse({
    required this.career,
    required this.isElective,
    required this.level,
    required this.name,
    required this.teacher,
  });

  final String career;
  final bool isElective;
  final String level;
  final String name;
  final String teacher;
  String? id;

  factory Curse.fromRawJson(String str) => Curse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Curse.fromJson(Map<String, dynamic> json) => Curse(
        career: json["career"],
        isElective: json["is_elective"],
        level: json["level"],
        name: json["name"],
        teacher: json["teacher"],
      );

  Map<String, dynamic> toJson() => {
        "career": career,
        "is_elective": isElective,
        "level": level,
        "name": name,
        "teacher": teacher,
      };
}
