import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:university_blog/models/blog.dart';
import 'package:university_blog/widgets/widgets.dart';

class BlogsProvider extends ChangeNotifier {
  final String _baseUrl = 'localhost:8080';
  List<Blog> data = [];

  BlogsProvider() {
    //getBlogs();
  }

  getBlogs() async {
    var url = Uri.http(_baseUrl, 'blogs');
    final response = await http.get(url);
    final BlogsResponse blogsResponse =
        BlogsResponse.fromRawJson(response.body);

    data = blogsResponse.data;
  }

  List<BlogFeed> toBlogFeeds() {
    List<BlogFeed> response = [];
    int i = 0;
    for (Blog blog in data) {
      response.add(BlogFeed(
          url: avatares[i],
          userName: blog.user.name,
          userNick: blog.user.username,
          content: blog.content,
          curse: blog.curse.name,
          teacher: blog.curse.teachers[0].name,
          likes: blog.stats.likes,
          dislikes: blog.stats.down));
      i++;
    }
    return response;
  }

  List<String> avatares = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_a4ESrgV1fyKimFM4LDdSFJodqGzUDlLaPA&usqp=CAU',
    'https://www.pngitem.com/pimgs/m/137-1370135_funny-png-avatar-funny-avatar-icons-transparent-png.png',
    'https://cdn3.iconfinder.com/data/icons/cool-avatars-2/190/00-07-2-512.png',
    'https://cdn4.iconfinder.com/data/icons/cool-avatars-2/190/00-13-512.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfYPF_Y7gsTtNReC0hxDfRrNG2tszt5asZfPkd_M9sSk-PDATrALB938Hy4D35Arjljhw&usqp=CAU',
    'https://www.pngkey.com/png/detail/57-575867_avatar-cartoon-eyes-female-funny-hair-how-to.png',
  ];
}
