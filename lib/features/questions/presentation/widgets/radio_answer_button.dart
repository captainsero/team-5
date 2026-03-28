import 'package:flutter/material.dart';
import 'package:team_5_examapp/core/constants/color_manager.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';

class RadioAnswerButton extends StatelessWidget {
  final String text;
  final String value;
  final bool isSelected;
  final VoidCallback onTap;

  const RadioAnswerButton({
    super.key,
    required this.text,
    required this.value,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(RadiusSize.r10),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p8,
          vertical: AppPadding.p16,
        ),
        height: AppSize.s52,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.selectedAnswerBg
              : AppColors.unselectedAnswerBg,
          borderRadius: BorderRadius.circular(RadiusSize.r10),
        ),
        child: Row(
          children: [
            Radio(
              value: value,
              hoverColor: Theme.of(context).colorScheme.primary,
              activeColor: Theme.of(context).colorScheme.primary,
            ),
            Expanded(
              child: Text(text, style: Theme.of(context).textTheme.titleSmall),
            ),
          ],
        ),
      ),
    );
  }
}
