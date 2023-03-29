import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:quizz_app/models/models.dart';
import 'package:http/http.dart' as http;

class ResultPage extends StatefulWidget {
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
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    widget.users.clear();
    Uri url = Uri.https('firechat-20622.firebaseio.com', '/users.json');
    var response = await http.get(url);
    List<User> tmp = [];
    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    jsonResponse.forEach((key, value) => {tmp.add(User.fromJson(value))});
    tmp.sort((a, b) => a.score.compareTo(b.score));
    widget.users.addAll(tmp.reversed.toList());
    _refreshController.refreshCompleted();
    setState(() {});
  }

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
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
                child: Text(
              'Puntuaciones Actuales',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
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
                rows: widget.users
                    .map((user) => DataRow(cells: [
                          DataCell(Text(user.date)),
                          DataCell(Text(user.name)),
                          DataCell(Text(user.score.toString())),
                        ]))
                    .toList()),
          ],
        ),
      ),
    );
  }
}
