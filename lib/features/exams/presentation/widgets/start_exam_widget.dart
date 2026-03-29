import 'package:flutter/material.dart';
import 'package:team_5_examapp/config/models/exam_model.dart';
import 'package:team_5_examapp/core/constants/color_manager.dart';

class StartExamScreen extends StatelessWidget {
  final ExamModel exam;

  const StartExamScreen({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        leading: IconButton(

          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/Profit.png"),
                    const SizedBox(width: 10),

                    Text(
                      exam.title,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(fontSize: 24),
                    ),

                    const Spacer(),

                    Text(
                      "${exam.duration} Minutes",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "High Level",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(width: 5),
                    Text("|", style: TextStyle(color: AppColors.primary)),
                    const SizedBox(width: 5),
                    Text(
                      "${exam.numberOfQuestions} Question",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            Container(height: 1, color: Colors.grey.shade300),

            const SizedBox(height: 20),

            Text("Instructions", style: Theme.of(context).textTheme.titleLarge),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("• Lorem ipsum dolor sit amet consectetur."),
                  SizedBox(height: 5),
                  Text("• Lorem ipsum dolor sit amet consectetur."),
                  SizedBox(height: 5),
                  Text("• Lorem ipsum dolor sit amet consectetur."),
                  SizedBox(height: 5),
                  Text("• Lorem ipsum dolor sit amet consectetur."),
                ],
              ),
            ),

            SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {}, child: Text("Start")),
            ),
          ],
        ),
      ),
    );
  }
}
