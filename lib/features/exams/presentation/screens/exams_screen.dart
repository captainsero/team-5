import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_5_examapp/config/di/di.dart';
import 'package:team_5_examapp/core/constants/font_manager.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';
import 'package:team_5_examapp/features/exams/presentation/view_model/exams_view_model.dart';
import 'package:team_5_examapp/features/exams/presentation/widgets/each_exam_widget.dart';
import 'package:team_5_examapp/features/subjects_portal/domain/models/subject_model.dart';
import 'package:team_5_examapp/generated/l10n.dart';


class ExamsScreen extends StatelessWidget {

  final SubjectModel subject;

  final String token;

  const ExamsScreen({
    super.key,
    required this.subject,
    required this.token,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<ExamsViewModel>()..getExams(token: token, subjectId: subject.id),

      child: Scaffold(
        appBar: AppBar(
          title: Text(
            subject.name,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          leadingWidth: AppSize.s60,

          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),

        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: AppSize.s20, vertical: AppSize.s10),

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
                return Center(child: Text(S.of(context).noExamsFound));
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
                          padding: EdgeInsets.only(top: AppSize.s10, bottom: AppSize.s10),
                          child: Text(
                            exam.title,
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.normal,
                                  fontSize: FontSize.s25,
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
