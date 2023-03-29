import 'package:flutter/material.dart';
import 'package:quizz_app/models/models.dart';

class ResultPage extends StatelessWidget {
  final double score;
  final List<Question> questions;
  final PageController controller;
  const ResultPage(
      {super.key,
      required this.score,
      required this.questions,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black38,
              fixedSize: const Size(130, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))),
          onPressed: null,
          child: const Text(
            'Intentar de Nuevo',
            textAlign: TextAlign.center,
          )),
      body: Center(
          child: Text(
        'Obtuviste ${score.toStringAsFixed(1)} puntos!',
        maxLines: 2,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.green.shade400,
            fontSize: 40,
            fontWeight: FontWeight.bold),
      )),
    );
  }
}
