import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class TeachersProvider extends ChangeNotifier {
  final String _baseUrl = 'university-blog-c1d86-default-rtdb.firebaseio.com';
  final List<Teacher> teachers = [];
  bool isLoading = false;

  TeachersProvider() {
    getTeachers();
  }

  Future<List<Teacher>> getTeachers() async {
    isLoading = true;
    notifyListeners();
    var url = Uri.https(_baseUrl, '/teacher.json');
    final response = await http.get(url);
    final Map<String, dynamic> teachersMap = json.decode(response.body);
    teachersMap.forEach((key, value) {
      final tmpTeacher = Teacher.fromJson(value);
      tmpTeacher.id = key;
      teachers.add(tmpTeacher);
    });
    isLoading = false;
    notifyListeners();
    return teachers;
  }

  String getName(String id) {
    return teachers.where((teacher) => teacher.id == id).toList()[0].fullName;
  }
}
