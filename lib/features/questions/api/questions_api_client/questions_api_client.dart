import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:team_5_examapp/core/constants/app_end_points.dart';
import 'package:team_5_examapp/features/questions/data/models/responses/questions_response.dart';

part 'questions_api_client.g.dart';

@injectable
@RestApi()
abstract class QuestionsApiClient {
  @factoryMethod
  factory QuestionsApiClient(Dio dio) = _QuestionsApiClient;

  @GET(AppEndPoints.questions)
  Future<QuestionsResponse> getAllQuestionsOnExam({
    @Header('token') String token,
    @Query('exam') String examId,
  });
}
