import 'package:flutter/material.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';
import 'package:team_5_examapp/features/questions/presentation/widgets/checkbox_answer_button.dart';
import 'package:team_5_examapp/features/questions/presentation/widgets/radio_answer_button.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({super.key, required this.isRadio});
  final bool isRadio;

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  String? selectedAnswerKey;
  final List<String> selectedAnswers = [];

  final List<Map<String, String>> fakeAnswers = [
    {'key': 'a', 'answer': 'Its going to rain today.'},
    {'key': 'b', 'answer': 'It’s going to rain today.'},
    {'key': 'c', 'answer': 'Its going to rain, today.'},
    {'key': 'd', 'answer': 'Its going, to rain today.'},
  ];

  int? selectedIndex;

  void toggleAnswer(String key) {
    setState(() {
      if (selectedAnswers.contains(key)) {
        selectedAnswers.remove(key);
      } else {
        selectedAnswers.add(key);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select the correctly punctuated sentence.",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: AppSize.s25),
        widget.isRadio
            ? RadioGroup(
                groupValue: selectedAnswerKey,
                onChanged: (value) {
                  setState(() {
                    selectedAnswerKey = value;
                  });
                },
                child: Column(
                  children: [
                    ...fakeAnswers.map((answer) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: RadioAnswerButton(
                          text: answer['answer']!,
                          value: answer['key']!,
                          isSelected: selectedAnswerKey == answer['key'],
                          onTap: () {
                            setState(() {
                              selectedAnswerKey = answer['key'];
                            });
                          },
                        ),
                      );
                    }),
                  ],
                ),
              )
            : Column(
                children: [
                  ...fakeAnswers.map((answer) {
                    final key = answer['key']!;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: CheckboxAnswerButton(
                        text: answer['answer']!,
                        value: key,
                        isSelected: selectedAnswers.contains(key),
                        onTap: () => toggleAnswer(key),
                      ),
                    );
                  }),
                ],
              ),
      ],
    );
  }
}
