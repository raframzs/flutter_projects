import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:university_blog/providers/blogs_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BlogsProvider provider = Provider.of<BlogsProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Blog : Universidad Libre',
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          child: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () => null,
        ),
        body: ListView(
          children: provider.toBlogFeeds(),
        ));
  }
}
