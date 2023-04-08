import 'dart:convert';

import 'models.dart';

class Event {
  Event({
    required this.id,
    required this.url,
    required this.mapUrl,
    required this.localDate,
    required this.utcDate,
    required this.latitude,
    required this.longitude,
    required this.depth,
    required this.magnitude,
    required this.geoReference,
  });

  String id;
  String url;
  String mapUrl;
  DateTime localDate;
  DateTime utcDate;
  double latitude;
  double longitude;
  int depth;
  Magnitude magnitude;
  String geoReference;

  Uri get mapUri {
    return Uri.http('sismologia.cl', mapUrl.substring(21));
  }

  Uri get urlUri {
    return Uri.http('sismologia.cl', url.substring(21));
  }

  factory Event.fromRawJson(String str) => Event.fromJson(json.decode(str));

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        url: json["url"],
        mapUrl: json["map_url"],
        localDate: DateTime.parse(json["local_date"]),
        utcDate: DateTime.parse(json["utc_date"]),
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        depth: json["depth"],
        magnitude: Magnitude.fromJson(json["magnitude"]),
        geoReference: json["geo_reference"],
      );
}
