import 'dart:convert';

class User {
  User({
    required this.date,
    required this.name,
    required this.score,
  });

  String date;
  String name;
  String score;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        date: json["date"],
        name: json["name"],
        score: json["score"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "name": name,
        "score": score,
      };
}
