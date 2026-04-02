import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_5_examapp/config/di/di.dart';
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
  final viewModel = getIt.get<ExploreCubit>();

  @override
  void initState() async {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExploreCubit>(
      create: (context) => viewModel,
      child: BlocBuilder<ExploreCubit, ExploreState>(
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
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (subjectState.data != null &&
              subjectState.errorMessage == null) {
            final subjects = subjectState.data!;
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

                      CustomSearchBar(),
                      ListView.builder(
                        itemCount: subjects.length,
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
          }

          return Scaffold(
            body: Center(child: Text('Explore Screen: no subjects available')),
          );
        },
      ),
    );
  }
}
