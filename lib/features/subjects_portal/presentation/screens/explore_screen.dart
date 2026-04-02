import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_5_examapp/core/constants/color_manager.dart';
import 'package:team_5_examapp/core/constants/constants_manager.dart';
import 'package:team_5_examapp/features/subjects_portal/presentation/view_model/cubit/explore_cubit.dart';
import 'package:team_5_examapp/features/subjects_portal/presentation/widgets/custom_search_bar.dart';
import 'package:team_5_examapp/features/subjects_portal/presentation/widgets/subject_card.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<ExploreCubit>().getAllSubjects();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreCubit, ExploreState>(
      builder: (context, state) {
        final subjectState = state.subjectState;

        if (subjectState.isLoading) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                AppConstants.surveyAppBarTitle,
                style: TextStyle(color: AppColors.primary),
              ),
            ),
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        if (subjectState.errorMessage != null) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                AppConstants.surveyAppBarTitle,
                style: TextStyle(color: AppColors.primary),
              ),
            ),
            body: Center(child: Text(subjectState.errorMessage!)),
          );
        }

        final subjects = state.filteredSubjects;
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      AppConstants.surveyAppBarTitle,
                      style: TextStyle(color: AppColors.primary),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const CustomSearchBar(),
                  ListView.builder(
                    itemCount: subjects.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final subject = subjects[index];
                      return SubjectCard(subject: subject);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
