import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quizz_app/widgets/options.dart';
import 'package:timer_count_down/timer_controller.dart';

import 'models/models.dart';
import 'widgets/custom_input.dart';
import 'widgets/result_page.dart';

import 'package:http/http.dart' as http;

void main() async {
  List<Question> data = await getQuestionList();
  data.shuffle();
  runApp(MainApp(data: data));
}

class MainApp extends StatelessWidget {
  final List<Question> data;
  const MainApp({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: QuestionScreen(questions: data),
      ),
    );
  }
}

class QuestionScreen extends StatefulWidget {
  final List<Question> questions;
  const QuestionScreen({super.key, required this.questions});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late PageController _controller;
  late List<Question> questions;
  int _questionNumber = 1;
  double _score = 0;
  double _scoreTime = 0;
  bool _isLocked = false;
  bool start = true;
  User user = User('', 0);
  final CountdownController countdownController =
      CountdownController(autoStart: true);

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    questions = widget.questions;
  }

  setScoreWhenTimeLeft(double time) {
    _scoreTime = time;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: start
            ? const Icon(
                Icons.person,
                size: 40,
              )
            : Text(
                'Pregunta $_questionNumber/${questions.length}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Expanded(
              child: PageView.builder(
            controller: _controller,
            itemCount: questions.length + 1,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              if (index == 0) {
                start = false;
                return buildUserSettings(context);
              }
              final Question question = questions[index];
              return buildQuestion(question);
            },
          )),
          _isLocked
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 120),
                  child: buildElevatedButton(null, null),
                )
              : const SizedBox.shrink(),
          const SizedBox(
            height: 20,
          )
        ]),
      ),
    );
  }

  Column buildQuestion(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 32,
        ),
        Text(
          question.text,
          style: const TextStyle(fontSize: 35),
        ),
        const SizedBox(
          height: 32,
        ),
        Expanded(
            child: Options(
          setScoreFromTime: setScoreWhenTimeLeft,
          counterController: countdownController,
          nextPage: nextPage,
          controller: _controller,
          question: question,
          onClickedOption: (option) {
            countdownController.pause();
            if (question.isLocked) return;
            setState(() {
              question.isLocked = true;
              question.selected = option;
            });
            _isLocked = question.isLocked;
            if (question.selected!.isCorrect) _score = _score + _scoreTime;
          },
        ))
      ],
    );
  }

  ElevatedButton buildElevatedButton(
      String? title, Map<String, dynamic>? formValues) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(130, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        onPressed: () {
          nextPage(formValues);
        },
        child: Text(
          title ??
              (_questionNumber < questions.length
                  ? 'Siguiente Pregunta'
                  : 'Ver Resultados'),
          textAlign: TextAlign.center,
        ));
  }

  void nextPage(Map<String, dynamic>? userForm) {
    if (userForm != null) {
      user.name = userForm['name'];
    }
    if (_questionNumber < questions.length) {
      _controller.nextPage(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInExpo);
      setState(() {
        _questionNumber++;
        _isLocked = false;
      });
    } else {
      user.score = _score;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
                score: _score,
                questions: questions,
                controller: _controller,
                user: user),
          ));
    }
  }

  void setScore(Question question, double time) {
    if (question.selected!.isCorrect) _score = _score + time;
  }

  Widget buildUserSettings(BuildContext context) {
    final GlobalKey<FormState> form = GlobalKey();
    final Map<String, dynamic> userForm = {
      'name': '',
      'score': 0,
    };
    return SingleChildScrollView(
      reverse: false,
      child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: MediaQuery.of(context).size.height * 0.3,
          ),
          child: Form(
              key: form,
              child: Column(children: [
                CustomInputField(
                  helperText: 'Ingrese un nombre de jugador',
                  labelText: 'Nombre',
                  formProperty: 'name',
                  formValues: userForm,
                ),
                const SizedBox(
                  height: 40,
                ),
                buildElevatedButton('Comenzar!', userForm),
              ]))),
    );
  }
}

Future<List<Question>> getQuestionList() async {
  final fields = await getDataFromFirebase();
  List<Question> questions = [];
  for (var i = 1; i <= 10; i++) {
    List<String> x =
        fields[i].toString().replaceAll("[", "").replaceAll("]", "").split(';');
    String questionText = x[0];
    List<String> optionsList = x[1].split('-');
    List<Option> options = [];
    for (var i = 0; i < optionsList.length; i++) {
      options
          .add(Option(text: optionsList[i], isCorrect: i == 0 ? true : false));
    }
    options.shuffle();
    questions.add(Question(text: questionText, options: options));
  }
  return questions;
}

Future<List<String>> getDataFromFirebase() async {
  Uri url = Uri.https('firechat-20622.firebaseio.com', '/quiz.json');
  var response = await http.get(url);

  var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
  var fileString = jsonResponse['base64'];
  List<String> data =
      utf8.decode(base64.decode(fileString)).toString().split('\n');
  return data;
}
