import 'dart:convert';

import 'models.dart';

class SismosResponse {
  SismosResponse({
    required this.statusCode,
    required this.statusDescription,
    required this.events,
  });

  int statusCode;
  String statusDescription;
  List<Event> events;

  factory SismosResponse.fromRawJson(String str) =>
      SismosResponse.fromJson(json.decode(str));

  factory SismosResponse.fromJson(Map<String, dynamic> json) => SismosResponse(
        statusCode: json["status_code"],
        statusDescription: json["status_description"],
        events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
      );
}
