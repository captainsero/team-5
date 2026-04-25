import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_5_examapp/config/di/di.dart';

import '../../../subjects_portal/presentation/widgets/custom_bttom_nav_bar.dart';
import '../view_model/result_view_model.dart';

class ResultsScreen extends StatefulWidget {
  final String token;

  const ResultsScreen({super.key, required this.token});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ResultsViewModel>()..getResults(token: widget.token),

      child: Scaffold(
        bottomNavigationBar: const CustomBottomNavBar(),

        appBar: AppBar(title: const Text("Results")),

        body: BlocBuilder<ResultsViewModel, ResultsState>(
          builder: (context, state) {
            if (state.resultsState.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.resultsState.errorMessage != null) {
              return Center(
                child: Text(state.resultsState.errorMessage!),
              );
            }

            final results = state.resultsState.data ?? [];

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: results.length,
              itemBuilder: (context, index) {
                final result = results[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    title: Text(result.title),
                    subtitle: Text("${result.questions} Questions"),
                    trailing: Text("${result.duration} min"),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}