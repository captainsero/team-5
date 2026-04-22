import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_5_examapp/core/constants/color_manager.dart';
import 'package:team_5_examapp/core/constants/constants_manager.dart';
import 'package:team_5_examapp/features/subjects_portal/presentation/view_model/cubit/explore_cubit.dart';
import 'package:team_5_examapp/features/subjects_portal/presentation/widgets/custom_search_bar.dart';
import 'package:team_5_examapp/features/subjects_portal/presentation/widgets/subject_card.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreCubit, ExploreState>(
      builder: (context, state) {
        final subjectState = state.subjectState;

        // Loading
        if (subjectState.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        // Error
        if (subjectState.errorMessage != null) {
          return Center(child: Text(subjectState.errorMessage!));
        }

        // Empty
        if (subjectState.data == null || subjectState.data!.isEmpty) {
          return Center(child: Text('No subjects available'));
        }

        // Success
        final subjects = subjectState.data!;

        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  AppConstants.surveyAppBarTitle,
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
              CustomSearchBar(),
              Expanded(
                child: ListView.builder(
                  itemCount: subjects.length,
                  itemBuilder: (context, index) {
                    return SubjectCard(subject: subjects[index]);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
