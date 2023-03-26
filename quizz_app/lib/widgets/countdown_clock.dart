import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../models/models.dart';

class CountdownClock extends StatelessWidget {
  final CountdownController controller;

  const CountdownClock({
    super.key,
    required this.question,
    required this.nextPage,
    required this.controller,
  });

  final Question question;
  final Function nextPage;
  @override
  Widget build(BuildContext context) {
    return Countdown(
      controller: controller,
      seconds: 5,
      build: (_, double time) {
        return Text(
          time.toString(),
          style: TextStyle(
              fontSize: 50, color: time < 10 ? Colors.red : Colors.blue),
        );
      },
      interval: const Duration(milliseconds: 100),
      onFinished: () {
        Option i =
            question.options.where((element) => element.isCorrect).toList()[0];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.blue,
            content: Column(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.flag,
                      color: Colors.red,
                      size: 30,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '¡Se acabo el tiempo! La respuesta era: ',
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(i.text,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold))
              ],
            ),
          ),
        );
        nextPage();
      },
    );
  }
}
