import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_5_examapp/core/constants/color_manager.dart';
import 'package:team_5_examapp/features/questions/presentation/view_model/cubit/questions_view_model.dart';
import 'package:team_5_examapp/features/questions/presentation/widgets/time_out_dialog.dart';

class TimerText extends StatelessWidget {
  const TimerText({super.key, required this.questionsViewModel});
  final QuestionsViewModel questionsViewModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuestionsViewModel, QuestionsState>(
      buildWhen: (prev, curr) => prev.remainingSeconds != curr.remainingSeconds,

      listenWhen: (prev, curr) => prev.isTimeUp != curr.isTimeUp,

      listener: (context, state) {
        if (state.isTimeUp) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => TimeOutDialog(
              time: 0,
              examId: state.getAllQuestionsOnExamState.data![0].exam!.id,
              questionsViewModel: questionsViewModel,
            ),
          );
        }
      },

      builder: (context, state) {
        final minutes = state.remainingSeconds ~/ 60;
        final seconds = state.remainingSeconds % 60;

        final formatted =
            '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

        final isHalfTime = state.remainingSeconds <= (state.totalSeconds / 2);

        return Text(
          formatted,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: isHalfTime
                ? Theme.of(context).colorScheme.error
                : AppColors.sucess,
          ),
        );
      },
    );
  }
}
