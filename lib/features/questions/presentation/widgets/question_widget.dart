import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';
import 'package:team_5_examapp/features/questions/data/models/answer_dto.dart';
import 'package:team_5_examapp/features/questions/presentation/view_model/cubit/questions_view_model.dart';
import 'package:team_5_examapp/features/questions/presentation/widgets/checkbox_answer_button.dart';
import 'package:team_5_examapp/features/questions/presentation/widgets/radio_answer_button.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    super.key,
    required this.isRadio,
    required this.answers,
    required this.question,
    required this.questionId,
  });

  final bool isRadio;
  final List<AnswerDto> answers;
  final String question;
  final String questionId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionsViewModel, QuestionsState>(
      buildWhen: (previous, current) =>
          previous.currentAnswer != current.currentAnswer,
      builder: (context, state) {
        final selectedAnswer = state.currentAnswer;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(question, style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: AppSize.s25),

            if (isRadio)
              RadioGroup<String>(
                groupValue: selectedAnswer,
                onChanged: (_) {},
                child: Column(
                  children: answers.map((answer) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: RadioAnswerButton(
                        text: answer.answer,
                        value: answer.key,
                        isSelected: selectedAnswer == answer.key,
                        onTap: () {
                          context.read<QuestionsViewModel>().selectAnswer(
                            questionId: questionId,
                            answerKey: answer.key,
                          );
                        },
                      ),
                    );
                  }).toList(),
                ),
              )
            else
              Column(
                children: answers.map((answer) {
                  final selectedList = (selectedAnswer ?? '').isEmpty
                      ? <String>[]
                      : selectedAnswer!.split(',');

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: CheckboxAnswerButton(
                      text: answer.answer,
                      value: answer.key,
                      isSelected: selectedList.contains(answer.key),
                      onTap: () {
                        context.read<QuestionsViewModel>().toggleMultiAnswer(
                          questionId: questionId,
                          answerKey: answer.key,
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
          ],
        );
      },
    );
  }
}
