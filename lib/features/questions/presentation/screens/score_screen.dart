import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:team_5_examapp/core/constants/font_manager.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';
import 'package:team_5_examapp/core/routing/routes_path.dart';
import 'package:team_5_examapp/features/questions/presentation/view_model/cubit/questions_events.dart';
import 'package:team_5_examapp/features/questions/presentation/view_model/cubit/questions_view_model.dart';
import 'package:team_5_examapp/features/questions/presentation/widgets/answer_number_circle_avatar.dart';
import 'package:team_5_examapp/features/questions/presentation/widgets/score_bar.dart';
import 'package:team_5_examapp/generated/l10n.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({
    super.key,
    required this.time,
    required this.examId,
    required this.questionsViewModel,
  });
  final int time;
  final String examId;
  final QuestionsViewModel questionsViewModel;

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  void initState() {
    widget.questionsViewModel.doEvent(CheckQuestionsEvent(time: widget.time));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(left: AppPadding.p20),
          child: Text(S.of(context).examScore),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppPadding.p20),
        child: BlocBuilder<QuestionsViewModel, QuestionsState>(
          buildWhen: (previous, current) =>
              previous.checkQuestions != current.checkQuestions,
          builder: (context, state) {
            final data = state.checkQuestions.data;
            final isLoading = state.checkQuestions.isLoading;

            final scorePercentageText = data?.total ?? '0%';
            final roundedScorePercentageText =
                (double.tryParse(
                  scorePercentageText.replaceAll('%', ''),
                )?.toStringAsFixed(0) ??
                '0.0');
            final scorePercentageValue = double.tryParse(
              roundedScorePercentageText,
            );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    S.of(context).yourScore,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(fontSize: FontSize.s18),
                  ),
                ),
                SizedBox(height: AppSize.s20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ScoreBar(value: scorePercentageValue ?? 0.0),
                    Spacer(flex: 1),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).correct,
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        SizedBox(height: AppSize.s10),
                        Text(
                          S.of(context).incorrect,
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.error,
                              ),
                        ),
                      ],
                    ),
                    Spacer(flex: 2),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnswerNumberCircleAvatar(
                          color: Theme.of(context).colorScheme.primary,
                          number: data?.correct ?? 0,
                        ),
                        SizedBox(height: AppSize.s10),
                        AnswerNumberCircleAvatar(
                          color: Theme.of(context).colorScheme.error,
                          number: data?.wrong ?? 0,
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(flex: 1),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            context.go(RoutesPath.resultsRoute);
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
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : Text(S.of(context).showResults),
                  ),
                ),
                SizedBox(height: AppSize.s20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.questionsViewModel.doEvent(ResetAnswerBoxEvent());
                      context.pushReplacement(
                        RoutesPath.questionsRoute,
                        extra: widget.examId,
                      );
                    },
                    child: Text(S.of(context).startAgain),
                  ),
                ),
                Spacer(flex: 2),
              ],
            );
          },
        ),
      ),
    );
  }
}
