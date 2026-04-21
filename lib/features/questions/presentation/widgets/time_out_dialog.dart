import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:team_5_examapp/config/shared_models/extra_score_screen_model.dart';
import 'package:team_5_examapp/core/constants/assets_manager.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';
import 'package:team_5_examapp/core/routing/routes_path.dart';
import 'package:team_5_examapp/features/questions/presentation/view_model/cubit/questions_view_model.dart';
import 'package:team_5_examapp/generated/l10n.dart';

class TimeOutDialog extends StatelessWidget {
  const TimeOutDialog({
    super.key,
    required this.time,
    required this.examId,
    required this.questionsViewModel,
  });
  final int time;
  final String examId;
  final QuestionsViewModel questionsViewModel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RadiusSize.r10),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageAssets.sandClock),
          Text(
            S.of(context).timeOut,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.error,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              context.go(
                RoutesPath.scoreRoute,
                extra: ExtraScoreScreenModel(
                  time: time,
                  examId: examId,
                  questionsViewModel: questionsViewModel,
                ),
              );
            },
            child: Text(S.of(context).viewScore),
          ),
        ),
      ],
    );
  }
}
