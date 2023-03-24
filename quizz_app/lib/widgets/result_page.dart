import 'package:flutter/material.dart';

import '../models/models.dart';

class ResultPage extends StatelessWidget {
  final int score;
  const ResultPage({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    double result = (score / questions.length) * 100;
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
        child: result > 50
            ? Text(
                '¡Aprobaste el Quiz! con un ${result.round()}% de acierto',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.green.shade400,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              )
            : Text(
                '¡Reprobaste el Quiz! con un ${result.round()}% de acierto',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
