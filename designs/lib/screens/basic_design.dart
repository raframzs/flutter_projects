import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class BasicDesignScreen extends StatelessWidget {
  const BasicDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: const [
        AppBarImage(),
        BlogTitle(),
        ActionButton(),
        BlogText()
      ]),
    );
  }
}
