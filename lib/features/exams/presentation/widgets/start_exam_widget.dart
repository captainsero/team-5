import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:team_5_examapp/config/models/exam_model.dart';
import 'package:team_5_examapp/core/constants/assets_manager.dart';
import 'package:team_5_examapp/core/constants/color_manager.dart';
import 'package:team_5_examapp/core/constants/font_manager.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';
import 'package:team_5_examapp/core/routing/routes_manager.dart';
import 'package:team_5_examapp/generated/l10n.dart';

class StartExamScreen extends StatelessWidget {
  final ExamModel exam;

  const StartExamScreen({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: AppSize.s80,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p20,
          vertical: AppPadding.p10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Image.asset(ImageAssets.profit),
                    SizedBox(width: AppSize.s10),

                    Text(
                      exam.title,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(fontSize: FontSize.s24),
                    ),

                    const Spacer(),

                    Text(
                      "${exam.duration} ${S.of(context).minutes}",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSize.s10),
                Row(
                  children: [
                    Text(
                      S.of(context).highLevel,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(width: AppSize.s5),
                    Text(
                      S.of(context).separator,
                      style: TextStyle(color: AppColors.primary),
                    ),
                    SizedBox(width: AppSize.s5),
                    Text(
                      "${exam.numberOfQuestions} ${S.of(context).questions}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: AppSize.s20),

            Container(height: AppSize.s1, color: Colors.grey.shade300),

            SizedBox(height: AppSize.s20),

            Text(
              S.of(context).instructions,
              style: Theme.of(context).textTheme.titleLarge,
            ),

            SizedBox(height: AppSize.s10),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(S.of(context).lorem),
                  SizedBox(height: AppSize.s5),
                  Text(S.of(context).lorem),
                  SizedBox(height: AppSize.s5),
                  Text(S.of(context).lorem),
                  SizedBox(height: AppSize.s5),
                  Text(S.of(context).lorem),
                ],
              ),
            ),

            SizedBox(height: AppSize.s48),
            SizedBox(
              width: double.infinity,
              // child: ElevatedButton(
              //   onPressed: () =>
              //       context.push(Routes.questionsRoute, extra: exam.id),
              //   child: Text(S.of(context).start),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
