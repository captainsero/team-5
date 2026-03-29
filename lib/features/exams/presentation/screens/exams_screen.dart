import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_5_examapp/config/di/di.dart';
import 'package:team_5_examapp/features/exams/presentation/view_model/exams_view_model.dart';
import '../widgets/each_exam_widget.dart';

class ExamsScreen extends StatelessWidget {
  final String subjectId;
  final String token;

  const ExamsScreen({super.key, required this.subjectId, required this.token});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<ExamsViewModel>()..getExams(token: token, subjectId: subjectId),

      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Languages",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          leadingWidth: 60,

          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

          child: BlocBuilder<ExamsViewModel, ExamsState>(
            builder: (context, state) {
              final examsState = state.examsState;

              if (examsState.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (examsState.errorMessage != null) {
                return Center(child: Text(examsState.errorMessage!));
              }

              if (examsState.data == null || examsState.data!.isEmpty) {
                return const Center(child: Text("No Exams Found"));
              }

              final exams = examsState.data!;

              return ListView.builder(
                itemCount: exams.length,
                itemBuilder: (context, index) {
                  final exam = exams[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (index == 0 || exams[index - 1].title != exam.title)
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            exam.title,
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 25,
                                ),
                          ),
                        ),

                      EachExamWidget(exam: exam),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
