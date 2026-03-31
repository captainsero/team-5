import 'package:team_5_examapp/config/di/di.dart';
import 'package:team_5_examapp/features/questions/presentation/view_model/cubit/questions_view_model.dart';

abstract class GetViewModels {
  static QuestionsViewModel questionsViewModel = getIt
      .get<QuestionsViewModel>();
}
