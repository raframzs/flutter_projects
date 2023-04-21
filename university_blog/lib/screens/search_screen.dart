import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BlogAppBar(),
      body: Center(
        child: Text('SearchScreen'),
      ),
    );
  }
}
