import 'package:flutter/material.dart';
import 'package:team_5_examapp/core/constants/color_manager.dart';
import 'package:team_5_examapp/core/constants/font_manager.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';

class AnswerNumberCircleAvatar extends StatelessWidget {
  const AnswerNumberCircleAvatar({
    super.key,
    required this.color,
    required this.number,
  });
  final Color color;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.s25,
      height: AppSize.s25,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: AppSize.s1_5),
      ),
      child: CircleAvatar(
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: AppColors.transparent,
        child: Text(
          "$number",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: color,
            fontSize: FontSize.s14,
          ),
        ),
      ),
    );
  }
}
