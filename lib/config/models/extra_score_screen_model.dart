import 'package:team_5_examapp/features/questions/presentation/view_model/cubit/questions_view_model.dart';

class ExtraScoreScreenModel {
  final int time;
  final String examId;
  final QuestionsViewModel questionsViewModel;

  ExtraScoreScreenModel({
    required this.time,
    required this.examId,
    required this.questionsViewModel,
  });
}
