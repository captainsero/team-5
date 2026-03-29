import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:team_5_examapp/core/constants/app_end_points.dart';
import 'package:team_5_examapp/features/questions/data/models/responses/check_question_request.dart';
import 'package:team_5_examapp/features/questions/data/models/responses/check_question_response.dart';
import 'package:team_5_examapp/features/questions/data/models/responses/questions_response.dart';

part 'questions_api_client.g.dart';

@injectable
@RestApi()
abstract class QuestionsApiClient {
  @factoryMethod
  factory QuestionsApiClient(Dio dio) = _QuestionsApiClient;

  @GET(AppEndPoints.questions)
  Future<QuestionsResponse> getAllQuestionsOnExam({
    @Header('token') required String token,
    @Query('exam') required String examId,
  });

  @POST(AppEndPoints.checkQuestions)
  Future<CheckQuestionResponse> checkQuestions({
    @Body() required CheckQuestionRequest checkQuestionRequest,
    @Header('token') required String token,
  });
}
