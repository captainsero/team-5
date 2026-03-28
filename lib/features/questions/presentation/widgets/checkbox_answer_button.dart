import 'package:flutter/material.dart';
import 'package:team_5_examapp/core/constants/color_manager.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';

class CheckboxAnswerButton extends StatelessWidget {
  final String text;
  final String value;
  final bool isSelected;
  final VoidCallback onTap;

  const CheckboxAnswerButton({
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
            Checkbox(
              value: isSelected,
              onChanged: (_) => onTap(),
              activeColor: Theme.of(context).colorScheme.primary,
              checkColor: Colors.white,
              fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
                if (states.contains(WidgetState.selected)) {
                  return Theme.of(context).colorScheme.primary;
                }
                return Colors.transparent;
              }),
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
