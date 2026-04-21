import 'package:flutter/material.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';

class QuestionProgressBar extends StatelessWidget {
  final int currentQuestion;
  final int totalQuestions;

  const QuestionProgressBar({
    super.key,
    required this.currentQuestion,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    double progress = currentQuestion / totalQuestions;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Question $currentQuestion of $totalQuestions',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: AppSize.s10),
        LinearProgressIndicator(value: progress, minHeight: AppSize.s4),
      ],
    );
  }
}
