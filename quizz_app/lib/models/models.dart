class Question {
  final String text;
  final List<Option> options;
  bool isLocked;
  Option? selected;

  Question({required this.text, required this.options, this.isLocked = false});
}

class Option {
  final String text;
  final bool isCorrect;

  Option({required this.text, required this.isCorrect});
}

final List<Question> questions = [
  Question(text: 'Pregunta A?', options: [
    Option(text: 'Response A : a', isCorrect: false),
    Option(text: 'Response A : b', isCorrect: true),
    Option(text: 'Response A : c', isCorrect: false)
  ]),
  Question(text: 'Pregunta B?', options: [
    Option(text: 'Response B : a', isCorrect: true),
    Option(text: 'Response B : c', isCorrect: false),
    Option(text: 'Response B : b', isCorrect: false),
  ])
];
