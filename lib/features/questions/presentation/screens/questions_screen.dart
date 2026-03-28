import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:team_5_examapp/core/constants/assets_manager.dart';
import 'package:team_5_examapp/core/constants/color_manager.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';
import 'package:team_5_examapp/features/questions/presentation/widgets/question_progress_bar.dart';
import 'package:team_5_examapp/features/questions/presentation/widgets/question_widget.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
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
          children: [
            SizedBox(height: AppSize.s20),
            QuestionProgressBar(currentQuestion: 10, totalQuestions: 20),
            SizedBox(height: AppSize.s20),
            QuestionWidget(isRadio: false),
          ],
        ),
      ),
    );
  }
}
