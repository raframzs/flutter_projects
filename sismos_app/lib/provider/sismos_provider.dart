import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:sismos_app/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:sismos_app/models/sismos_response.dart';

class SismosProvider extends ChangeNotifier {
  final log = Logger('SismosProvider');

  SismosProvider() {
    getEvents();
  }

  Future<List<Event>> getEvents() async {
    var url = Uri.https('api.xor.cl', 'sismo/recent');
    final jsonData = await http.get(url);
    log.fine('Fetching sismos data, status: ${jsonData.statusCode}');
    final SismosResponse sismosResponse =
        SismosResponse.fromRawJson(jsonData.body);
    return sismosResponse.events;
  }
}
