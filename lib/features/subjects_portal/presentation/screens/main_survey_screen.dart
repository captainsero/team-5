import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_5_examapp/features/subjects_portal/presentation/screens/explore_screen.dart';
import 'package:team_5_examapp/features/subjects_portal/presentation/screens/profile.dart';
import 'package:team_5_examapp/features/subjects_portal/presentation/screens/results.dart';
import 'package:team_5_examapp/features/subjects_portal/presentation/view_model/cubit/explore_cubit.dart';
import 'package:team_5_examapp/features/subjects_portal/presentation/widgets/custom_bttom_nav_bar.dart';

class MainSurveyScreen extends StatefulWidget {
  const MainSurveyScreen({super.key});

  @override
  State<MainSurveyScreen> createState() => _MainSurveyScreenState();
}

class _MainSurveyScreenState extends State<MainSurveyScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreCubit, ExploreState>(
      builder: (context, state) {
        final pages = const [ExploreScreen(), ResultsScreen(), ProfileScreen()];

        return Scaffold(
          body: IndexedStack(index: state.currentIndex, children: pages),
          bottomNavigationBar: const CustomBottomNavBar(),
        );
      },
    );
  }
}
