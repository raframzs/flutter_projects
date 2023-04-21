import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class CreateBlogScreen extends StatelessWidget {
  const CreateBlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BlogAppBar(),
      body: Center(
        child: Text('CreateBlogScreen'),
      ),
    );
  }
}
