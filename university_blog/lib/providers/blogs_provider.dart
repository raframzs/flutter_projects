import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class BlogsProvider extends ChangeNotifier {
  final String _baseUrl = 'university-blog-c1d86-default-rtdb.firebaseio.com';
  final List<Blog> blogs = [];
  bool isLoading = false;

  BlogsProvider() {
    getBlogs();
  }

  Future<List<Blog>> getBlogs() async {
    isLoading = true;
    notifyListeners();
    var url = Uri.https(_baseUrl, '/blogs.json');
    final response = await http.get(url);
    final Map<String, dynamic> blogsMap = json.decode(response.body);
    blogsMap.forEach((key, value) {
      final tmpBlog = Blog.fromJson(value);
      tmpBlog.id = key;
      blogs.add(tmpBlog);
    });
    isLoading = false;
    notifyListeners();
    return blogs;
  }

  Future saveBlog(Blog blog) async {
    isLoading = true;
    notifyListeners();
    var url = Uri.https(_baseUrl, '/blogs.json');
    final resp = await http.post(url, body: blog.toRawJson());
    final decodedData = json.decode(resp.body);
    blog.id = decodedData['name'];
    blogs.add(blog);
    await Future.delayed(const Duration(seconds: 1));
    isLoading = false;
    notifyListeners();
  }
}
