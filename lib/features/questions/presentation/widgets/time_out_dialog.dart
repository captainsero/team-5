import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:team_5_examapp/core/constants/assets_manager.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';
import 'package:team_5_examapp/core/routing/routes_path.dart';
import 'package:team_5_examapp/generated/l10n.dart';

class TimeOutDialog extends StatelessWidget {
  const TimeOutDialog({super.key, required this.time, required this.examId});
  final int time;
  final String examId;

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
                extra: {'time': time, 'examId': examId},
              );
            },
            child: Text(S.of(context).viewScore),
          ),
        ),
      ],
    );
  }
}
