import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class CursesProvider extends ChangeNotifier {
  final String _baseUrl = 'university-blog-c1d86-default-rtdb.firebaseio.com';
  final List<Curse> curses = [];
  bool isLoading = false;

  CursesProvider() {
    getCurses();
  }

  Future<List<Curse>> getCurses() async {
    isLoading = true;
    notifyListeners();
    var url = Uri.https(_baseUrl, '/curses.json');
    final response = await http.get(url);
    final Map<String, dynamic> cursesMap = json.decode(response.body);
    cursesMap.forEach((key, value) {
      final tmpCurse = Curse.fromJson(value);
      tmpCurse.id = key;
      curses.add(tmpCurse);
    });
    isLoading = false;
    notifyListeners();
    return curses;
  }

  Curse getCurse(String id) {
    return curses.where((curse) => curse.id == id).toList()[0];
  }
}
