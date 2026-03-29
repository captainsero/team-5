import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:team_5_examapp/core/constants/assets_manager.dart';
import 'package:team_5_examapp/core/constants/color_manager.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';
import 'package:team_5_examapp/features/questions/presentation/widgets/question_progress_bar.dart';
import 'package:team_5_examapp/features/questions/presentation/widgets/question_widget.dart';
import 'package:team_5_examapp/features/questions/presentation/widgets/time_out_dialog.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  bool isLast = false;

  void showTimeOutDialog(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return TimeOutDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Exam"),
        actions: [
          Image.asset(ImageAssets.clock),
          Text(
            "30:00",
            style: Theme.of(
              context,
            ).textTheme.headlineMedium!.copyWith(color: AppColors.sucess),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: AppSize.s20,
          children: [
            QuestionProgressBar(currentQuestion: 10, totalQuestions: 20),

            QuestionWidget(isRadio: false),

            SizedBox(height: AppSize.s50),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: AppSize.s16,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: null,

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

                    child: Text("Back"),
                  ),
                ),

                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(isLast ? "Finish" : "Next"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
