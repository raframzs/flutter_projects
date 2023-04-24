import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class UsersProvider extends ChangeNotifier {
  final String _baseUrl = 'university-blog-c1d86-default-rtdb.firebaseio.com';
  final List<User> users = [];
  bool isLoading = false;
  User? logged;
  UsersProvider() {
    getUsers();
  }

  Future<List<User>> getUsers() async {
    isLoading = true;
    notifyListeners();
    var url = Uri.https(_baseUrl, '/users.json');
    final response = await http.get(url);
    final Map<String, dynamic> usersMap = json.decode(response.body);
    usersMap.forEach((key, value) {
      final tmpUser = User.fromJson(value);
      tmpUser.id = key;
      users.add(tmpUser);
    });
    isLoading = false;
    notifyListeners();
    return users;
  }

  String getName(String id) {
    return users
        .where((user) => user.id == id)
        .toList()[0]
        .email
        .replaceFirst("@unilibre.edu.co", "");
  }
}
