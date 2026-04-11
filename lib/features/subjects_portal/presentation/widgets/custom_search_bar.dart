import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_5_examapp/core/constants/color_manager.dart';
import 'package:team_5_examapp/features/subjects_portal/presentation/view_model/cubit/explore_cubit.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: AppColors.grey),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: AppColors.grey),

            SizedBox(width: 8),

            Expanded(
              child: TextField(
                onChanged: (value) {
                  context.read<ExploreCubit>().search(value);
                },
                decoration: InputDecoration(
                  hintText: "Search subjects...",
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
