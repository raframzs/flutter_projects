import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';

import '../models/models.dart';
import 'countdown_clock.dart';

class Options extends StatefulWidget {
  final Question question;
  final ValueChanged<Option> onClickedOption;
  final Function(Map<String, dynamic>? async) nextPage;
  final PageController controller;
  final CountdownController counterController;
  final Function(double) setScoreFromTime;

  const Options(
      {super.key,
      required this.question,
      required this.onClickedOption,
      required this.controller,
      required this.nextPage,
      required this.counterController,
      required this.setScoreFromTime});

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  scoreOnTimeRunning(double time) {
    widget.setScoreFromTime(time);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: widget.question.options
              .map((option) => buildOption(context, option))
              .toList(),
        ),
        CountdownClock(
            question: widget.question,
            nextPage: widget.nextPage,
            controller: widget.counterController,
            scoreOnTimeRunning: scoreOnTimeRunning)
      ],
    );
  }

  GestureDetector buildOption(BuildContext context, Option option) {
    final color = getColorForOption(option, widget.question);
    return GestureDetector(
      onTap: () => widget.onClickedOption(option),
      child: Container(
        height: 60,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(option.text, style: Theme.of(context).textTheme.headlineSmall),
            getIconForOption(option, widget.question)
          ],
        ),
      ),
    );
  }

  Color getColorForOption(Option option, Question question) {
    final isSelected = option == (question.selected);
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect ? Colors.green : Colors.red;
      } else if (option.isCorrect) {
        return Colors.green;
      }
    }
    return Colors.grey.shade300;
  }

  Widget getIconForOption(Option option, Question question) {
    final isSelected = option == question.selected;
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect
            ? const Icon(Icons.check_circle, color: Colors.green)
            : const Icon(Icons.cancel, color: Colors.red);
      } else if (option.isCorrect) {
        return const Icon(Icons.check_circle, color: Colors.green);
      }
    }
    return const SizedBox.shrink();
  }
}
