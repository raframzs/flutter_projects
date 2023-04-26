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
    blogs.clear();
    List<Blog> tmp = [];
    blogsMap.forEach((key, value) {
      final tmpBlog = Blog.fromJson(value);
      tmpBlog.id = key;
      tmp.add(tmpBlog);
    });
    tmp.sort((a, b) => a.created.compareTo(b.created));
    blogs.addAll(tmp.reversed.toList());
    isLoading = false;
    notifyListeners();
    return blogs;
  }

  Future<List<Blog>> sortBlogsByPopular() async {
    isLoading = true;
    notifyListeners();
    var url = Uri.https(_baseUrl, '/blogs.json');
    final response = await http.get(url);
    final Map<String, dynamic> blogsMap = json.decode(response.body);
    blogs.clear();
    List<Blog> tmp = [];
    blogsMap.forEach((key, value) {
      final tmpBlog = Blog.fromJson(value);
      tmpBlog.id = key;
      tmp.add(tmpBlog);
    });
    tmp.sort((a, b) => a.likes.compareTo(b.likes));
    blogs.addAll(tmp.reversed.toList());
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

  Future<bool> updateBlog(Blog blog, bool isLiked) async {
    var url = Uri.https(_baseUrl, '/blogs/${blog.id}.json');
    await http.put(url, body: blog.toRawJson());
    final index = blogs.indexWhere((element) => element.id == blog.id);
    blogs[index] = blog;
    return !isLiked;
  }
}
