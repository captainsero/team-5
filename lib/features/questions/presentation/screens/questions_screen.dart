import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:team_5_examapp/config/shared_models/extra_score_screen_model.dart';
import 'package:team_5_examapp/core/constants/assets_manager.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';
import 'package:team_5_examapp/core/routing/routes_path.dart';
import 'package:team_5_examapp/features/questions/presentation/view_model/cubit/questions_events.dart';
import 'package:team_5_examapp/features/questions/presentation/view_model/cubit/questions_view_model.dart';
import 'package:team_5_examapp/features/questions/presentation/widgets/question_progress_bar.dart';
import 'package:team_5_examapp/features/questions/presentation/widgets/question_widget.dart';
import 'package:team_5_examapp/features/questions/presentation/widgets/timer_text.dart';
import 'package:team_5_examapp/generated/l10n.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.examId,
    required this.questionsViewModel,
  });
  final String examId;
  final QuestionsViewModel questionsViewModel;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  void initState() {
    widget.questionsViewModel.doEvent(
      GetAllQuestionsOnExamEvent(examId: widget.examId),
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
        final questions = state.getAllQuestionsOnExamState.data ?? [];
        final isLoading = state.getAllQuestionsOnExamState.isLoading;
        final errorMessage = state.getAllQuestionsOnExamState.errorMessage;
        final isAnswered = questions.isEmpty
            ? false
            : questions[currentQuestion].isAnswerd ?? false;
        bool isRadio = true;

        if (state.getAllQuestionsOnExamState.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (errorMessage != null || questions.isEmpty) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back_ios),
              ),
              title: Text(S.of(context).exam),
            ),
            body: Center(
              child: Text(
                errorMessage ?? 'S.current.noQuestionsFound',
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
                  totalQuestions: questions.length,
                ),

                QuestionWidget(
                  isRadio: isRadio,
                  answers: isLoading
                      ? []
                      : questions[currentQuestion].answers ?? [],
                  question: isLoading
                      ? ''
                      : questions[currentQuestion].question ?? '',
                  questionId: isLoading
                      ? ''
                      : questions[currentQuestion].id ?? '',
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
                                context.read<QuestionsViewModel>().doEvent(
                                  PreviousQuestionEvent(questions: questions),
                                );
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
                                context.read<QuestionsViewModel>().doEvent(
                                  NextQuestionEvent(questions: questions),
                                );

                                if (isLast) {
                                  final minutes = state.remainingSeconds ~/ 60;
                                  widget.questionsViewModel.doEvent(
                                    StopTimerEvent(),
                                  );
                                  context.push(
                                    RoutesPath.scoreRoute,
                                    extra: ExtraScoreScreenModel(
                                      time: minutes,
                                      examId: questions[0].exam!.id,
                                      questionsViewModel:
                                          widget.questionsViewModel,
                                    ),
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
