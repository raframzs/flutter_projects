import 'dart:convert';

class Teacher {
  Teacher({
    required this.id,
    required this.created,
    required this.name,
    required this.surname,
    required this.gender,
    required this.antiquity,
  });

  int id;
  DateTime created;
  String name;
  String surname;
  String gender;
  int antiquity;

  factory Teacher.fromRawJson(String str) => Teacher.fromJson(json.decode(str));

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        id: json["id"],
        created: DateTime.parse(json["created"]),
        name: json["name"],
        surname: json["surname"],
        gender: json["gender"],
        antiquity: json["antiquity"],
      );
}
