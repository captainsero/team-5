import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:team_5_examapp/core/constants/assets_manager.dart';
import 'package:team_5_examapp/core/constants/color_manager.dart';

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
    );
  }
}
