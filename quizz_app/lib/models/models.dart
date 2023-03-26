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
