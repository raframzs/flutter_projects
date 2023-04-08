import 'dart:convert';

class Magnitude {
  Magnitude({
    required this.value,
    required this.measureUnit,
  });

  double value;
  String measureUnit;

  factory Magnitude.fromRawJson(String str) =>
      Magnitude.fromJson(json.decode(str));

  factory Magnitude.fromJson(Map<String, dynamic> json) => Magnitude(
        value: json["value"]?.toDouble(),
        measureUnit: json["measure_unit"]!,
      );
}
