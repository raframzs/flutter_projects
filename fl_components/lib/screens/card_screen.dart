import 'package:fl_components/screens/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cards'),
        ),
        body: ListView(
          children: const [
            CustomCardScreen(
              title: 'Card Sample X',
              subtitle:
                  'Sit sit quis enim laborum laborum est magna sunt occaecat fugiat.',
            )
          ],
        ));
  }
}
