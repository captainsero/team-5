import 'package:flutter/material.dart';
import 'package:team_5_examapp/config/models/exam_model.dart';
import 'package:team_5_examapp/core/constants/color_manager.dart';
import 'package:team_5_examapp/features/exams/presentation/widgets/start_exam_widget.dart';

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
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/Profit.png"),
            const SizedBox(width: 20),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "High Level",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),

                  Text(
                    "${exam.numberOfQuestions} Questions",
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: AppColors.grey),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Text(
                        "From: 1.00",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(width: 5),

                      Text(
                        "To: 6.00",
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
              "${exam.duration} minutes",
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
