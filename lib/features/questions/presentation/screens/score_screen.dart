import 'package:flutter/material.dart';
import 'package:team_5_examapp/core/constants/font_manager.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';
import 'package:team_5_examapp/features/questions/presentation/widgets/answer_number_circle_avatar.dart';
import 'package:team_5_examapp/features/questions/presentation/widgets/score_bar.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key, required this.examId});
  final String examId;

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: AppPadding.p20),
          child: Text("Exam Score"),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppPadding.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Your Score",
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(fontSize: FontSize.s18),
              ),
            ),

            SizedBox(height: AppSize.s20),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ScoreBar(value: 60),
                Spacer(flex: 1),
                Column(
                  spacing: AppSize.s10,
                  children: [
                    Text(
                      "Correct",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),

                    Text(
                      "Incorrect",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ],
                ),
                Spacer(flex: 2),

                Column(
                  spacing: AppSize.s10,
                  children: [
                    AnswerNumberCircleAvatar(
                      color: Theme.of(context).colorScheme.primary,
                      number: 18,
                    ),

                    AnswerNumberCircleAvatar(
                      color: Theme.of(context).colorScheme.error,
                      number: 2,
                    ),
                  ],
                ),
              ],
            ),
            Spacer(flex: 1),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom().copyWith(
                  backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.onPrimary,
                  ),

                  side: WidgetStatePropertyAll(
                    BorderSide(color: Theme.of(context).colorScheme.primary),
                  ),
                  foregroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
                child: Text("Show results"),
              ),
            ),

            SizedBox(height: AppSize.s20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Start again"),
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
