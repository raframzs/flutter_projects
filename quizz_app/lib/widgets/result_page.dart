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
      appBar: AppBar(
        title: Icon(
          Icons.flag,
          size: 50,
          color: Colors.amber.shade500,
        ),
      ),
      body: ListView(children: [
        const SizedBox(
          height: 20,
        ),
        const Center(
            child: Text(
          'Puntuaciones Actuales',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.grey),
        )),
        DataTable(
          columns: [
            DataColumn(
                label: Text('Fecha',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade600))),
            DataColumn(
                label: Text('Nombre',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade600))),
            DataColumn(
                label: Text('Puntaje',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade600))),
          ],
          rows: const [
            DataRow(cells: [
              DataCell(Text('1')),
              DataCell(Text('Stephen')),
              DataCell(Text('Actor')),
            ]),
            DataRow(cells: [
              DataCell(Text('5')),
              DataCell(Text('John')),
              DataCell(Text('Student')),
            ]),
            DataRow(cells: [
              DataCell(Text('10')),
              DataCell(Text('Harry')),
              DataCell(Text('Leader')),
            ]),
            DataRow(cells: [
              DataCell(Text('15')),
              DataCell(Text('Peter')),
              DataCell(Text('Scientist')),
            ]),
          ],
        ),
      ]),
    );
  }
}
//score.toStringAsFixed(1)