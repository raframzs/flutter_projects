import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:university_blog/models/blog.dart';
import 'package:university_blog/widgets/widgets.dart';

class BlogsProvider extends ChangeNotifier {
  final String _baseUrl = 'localhost:8080';
  List<Blog> data = [];

  BlogsProvider() {
    getBlogs();
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
    for (String photo in avatares) {
      response.add(BlogFeed(
          url: photo,
          userName: names[i],
          userNick: usernames[i],
          content: contents[i],
          curse: curseNames[i],
          teacher: teacherNames[i],
          likes: likes[i],
          dislikes: dislikes[i]));
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

  List<String> names = [
    'RAFAEL RAMIREZ',
    'JULIAN JIMENEZ',
    'DANIELA CHICAIZA',
    'MIGUEL CONTRERAS',
    'ANGEL LIZARAZO',
    'NATALIA RODRIGUEZ',
  ];

  List<String> usernames = [
    'raframzs',
    'jucajiro',
    'daniloquita',
    'miguelito777',
    'angeloflife',
    'natituipan',
  ];

  List<String> contents = [
    'Me la super suda',
    'Eu incididunt occaecat aliqua ullamco ullamco qui. Et commodo minim commodo fugiat in sint nisi in. Reprehenderit eu velit voluptate consectetur labore excepteur aliqua labore nulla proident officia adipisicing voluptate. Sint qui velit cupidatat deserunt pariatur duis adipisicing reprehenderit labore reprehenderit adipisicing cillum ex. Exercitation nisi nulla consectetur in reprehenderit dolore adipisicing consequat veniam nostrud id Lorem elit irure. Nostrud non incididunt mollit magna est sit quis labore.',
    'Anim ad et dolore culpa proident ut anim.',
    'Me siento con ganas de llorar',
    'No inscriban con el es trampa',
    'Lo quiero con todo mi corazón',
  ];

  List<String> curseNames = [
    'PROGRAMACIÓN MOVIL',
    'GERENCIA ESTRATEGICA',
    'BUSSINES ANALYTICS',
    'INVESTIGACIÓN II',
    'PROGRAMACIÓN LINEAL',
    'MACHINE LEARNING',
  ];

  List<String> teacherNames = [
    'RICARDO SANTA',
    'JAIRO CORTEZ',
    'ISMAEL RODRIGUEZ',
    'NEREIDA PALMAR',
    'HUMBERTO CUEVAS',
    'GUIDO CONTRERAS',
  ];

  List<int> likes = [
    234,
    3,
    9,
    0,
    26,
    89,
  ];

  List<int> dislikes = [
    0,
    20,
    76,
    4,
    0,
    1,
  ];
}
