import 'dart:convert';

class Stats {
  Stats({
    required this.likes,
    required this.up,
    required this.down,
  });

  int likes;
  int up;
  int down;

  factory Stats.fromRawJson(String str) => Stats.fromJson(json.decode(str));

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        likes: json["likes"],
        up: json["up"],
        down: json["down"],
      );
}
