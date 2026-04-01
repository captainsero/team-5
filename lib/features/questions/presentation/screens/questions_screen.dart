import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:team_5_examapp/config/get_view_models/get_view_models.dart';
import 'package:team_5_examapp/core/constants/assets_manager.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';
import 'package:team_5_examapp/core/routing/routes_manager.dart';
import 'package:team_5_examapp/features/questions/presentation/view_model/cubit/questions_view_model.dart';
import 'package:team_5_examapp/features/questions/presentation/widgets/question_progress_bar.dart';
import 'package:team_5_examapp/features/questions/presentation/widgets/question_widget.dart';
import 'package:team_5_examapp/features/questions/presentation/widgets/timer_text.dart';
import 'package:team_5_examapp/generated/l10n.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.examId});
  final String examId;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  void initState() {
    GetViewModels.questionsViewModel.getAllQuestionsOnExam(
      examId: widget.examId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionsViewModel, QuestionsState>(
      buildWhen: (previous, current) {
        return previous.getAllQuestionsOnExamState !=
                current.getAllQuestionsOnExamState ||
            previous.currentQuestion != current.currentQuestion ||
            previous.currentAnswer != current.currentAnswer;
      },
      builder: (context, state) {
        final currentQuestion = state.currentQuestion;
        final isLast = state.isLast;
        final questions = state.getAllQuestionsOnExamState.data;
        final isLoading = state.getAllQuestionsOnExamState.isLoading;
        final errorMassege = state.getAllQuestionsOnExamState.errorMessage;
        final isAnswered = questions?[currentQuestion].isAnswerd ?? false;
        bool isRadio = true;

        if (!isLoading && errorMassege == null && questions != null) {
          isRadio = questions[currentQuestion].type == 'single_choice';
        }
        if (!isLoading && questions == null && errorMassege != null) {
          return Scaffold(
            body: Center(
              child: Text(
                errorMassege,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: Icon(Icons.arrow_back_ios),
            ),
            title: Text(S.of(context).exam),
            actions: [Image.asset(ImageAssets.clock), TimerText()],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: AppSize.s20,
              children: [
                QuestionProgressBar(
                  currentQuestion: currentQuestion + 1,
                  totalQuestions: isLoading ? 40 : questions!.length,
                ),

                QuestionWidget(
                  isRadio: isRadio,
                  answers: isLoading ? [] : questions![currentQuestion].answers,
                  question: isLoading
                      ? ''
                      : questions![currentQuestion].question,
                  questionId: isLoading ? '' : questions![currentQuestion].id,
                ),

                SizedBox(height: AppSize.s50),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: AppSize.s16,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: currentQuestion == 0
                            ? null
                            : () {
                                context
                                    .read<QuestionsViewModel>()
                                    .previousQuestion(questions!);
                              },

                        style: ElevatedButton.styleFrom().copyWith(
                          backgroundColor: WidgetStatePropertyAll(
                            Theme.of(context).colorScheme.onPrimary,
                          ),

                          side: WidgetStatePropertyAll(
                            BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          foregroundColor: WidgetStatePropertyAll(
                            Theme.of(context).colorScheme.primary,
                          ),
                        ),

                        child: Text(S.of(context).back),
                      ),
                    ),

                    Expanded(
                      child: ElevatedButton(
                        onPressed: isAnswered
                            ? () {
                                context.read<QuestionsViewModel>().nextQuestion(
                                  questions!,
                                );

                                if (isLast) {
                                  final minutes = state.remainingSeconds ~/ 60;
                                  context.go(
                                    Routes.scoreRoute,
                                    extra: {
                                      'time': minutes,
                                      'examId': questions[0].exam.id,
                                    },
                                  );
                                }
                              }
                            : null,
                        child: Text(
                          isLast ? S.of(context).finish : S.of(context).next,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
