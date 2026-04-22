import 'package:flutter/material.dart';
import 'package:team_5_examapp/config/models/exam_model.dart';
import 'package:team_5_examapp/core/constants/assets_manager.dart';
import 'package:team_5_examapp/core/constants/color_manager.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';
import 'package:team_5_examapp/features/exams/presentation/widgets/start_exam_widget.dart';
import 'package:team_5_examapp/generated/l10n.dart';

class EachExamWidget extends StatelessWidget {
  final ExamModel exam;

  const EachExamWidget({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StartExamScreen(exam: exam)),
        );
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: AppSize.s16),
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.s24,
          vertical: AppSize.s16,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(RadiusSize.r20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.3),
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(ImageAssets.profit),
            SizedBox(width: AppSize.s20),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).highLevel,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),

                  Text(
                    "${exam.numberOfQuestions} ${S.of(context).questions}",
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: AppColors.grey),
                  ),

                  SizedBox(height: AppSize.s10),

                  Row(
                    children: [
                      Text(
                        S.of(context).from,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(width: AppSize.s5),

                      Text(
                        S.of(context).to,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Text(
              "${exam.duration} ${S.of(context).minutes}",
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
