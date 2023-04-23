import 'dart:convert';

class Teacher {
  Teacher({
    required this.fullName,
    required this.genero,
    required this.master,
    required this.profession,
    required this.seniorityYears,
  });

  final String fullName;
  final String genero;
  final String master;
  final String profession;
  final int seniorityYears;
  String? id;

  factory Teacher.fromRawJson(String str) => Teacher.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        fullName: json["full_name"],
        genero: json["genero"],
        master: json["master"],
        profession: json["profession"],
        seniorityYears: json["seniority_years"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "genero": genero,
        "master": master,
        "profession": profession,
        "seniority_years": seniorityYears,
      };
}
