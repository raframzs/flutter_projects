import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quizz_app/models/models.dart';
import 'package:http/http.dart' as http;

class ResultPage extends StatelessWidget {
  final double score;
  final List<Question> questions;
  final PageController controller;
  final User user;
  final List<User> users;
  const ResultPage(
      {super.key,
      required this.score,
      required this.questions,
      required this.controller,
      required this.user,
      required this.users});

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
      body: ListView(
        children: [
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
              rows: users
                  .map((user) => DataRow(cells: [
                        DataCell(Text(user.date)),
                        DataCell(Text(user.name)),
                        DataCell(Text(user.score.toString())),
                      ]))
                  .toList()),
        ],
      ),
    );
  }
}
