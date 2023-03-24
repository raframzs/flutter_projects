import 'dart:convert';

class User {
  User({
    required this.id,
    required this.created,
    required this.username,
    required this.password,
    required this.email,
    required this.name,
  });

  int id;
  DateTime created;
  String username;
  String password;
  String email;
  String name;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        created: DateTime.parse(json["created"]),
        username: json["username"],
        password: json["password"],
        email: json["email"],
        name: json["name"],
      );
}
