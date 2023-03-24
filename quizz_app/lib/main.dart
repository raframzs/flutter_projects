import 'package:flutter/material.dart';
import 'package:quizz_app/widgets/options.dart';

import 'models/models.dart';
import 'widgets/result_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: QuestionScreen(),
      ),
    );
  }
}

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late PageController _controller;
  int _questionNumber = 1;
  int _score = 0;
  bool _isLocked = false;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        const SizedBox(
          height: 50,
        ),
        Text(
          'Pregunta $_questionNumber/${questions.length}',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const Divider(
          thickness: 1,
          color: Colors.grey,
        ),
        Expanded(
            child: PageView.builder(
          controller: _controller,
          itemCount: questions.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final Question question = questions[index];
            return buildQuestion(question);
          },
        )),
        _isLocked
            ? Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: buildElevatedButton(),
              )
            : const SizedBox.shrink(),
        const SizedBox(
          height: 20,
        )
      ]),
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
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 32,
        ),
        Expanded(
            child: Options(
          question: question,
          onClickedOption: (option) {
            if (question.isLocked) return;
            setState(() {
              question.isLocked = true;
              question.selected = option;
            });
            _isLocked = question.isLocked;
            if (question.selected!.isCorrect) _score++;
          },
        ))
      ],
    );
  }

  ElevatedButton buildElevatedButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade200,
            fixedSize: const Size(130, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        onPressed: () {
          if (_questionNumber < questions.length) {
            _controller.nextPage(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInExpo);
            setState(() {
              _questionNumber++;
              _isLocked = false;
            });
          } else {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(score: _score),
                ));
          }
        },
        child: Text(
          _questionNumber < questions.length
              ? 'Siguiente Pregunta'
              : 'Ver Resultados',
          textAlign: TextAlign.center,
        ));
  }
}
