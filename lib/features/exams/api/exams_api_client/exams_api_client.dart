import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:team_5_examapp/core/constants/app_end_points.dart';
import 'package:team_5_examapp/features/exams/data/models/responses/exams_response.dart';

part 'exams_api_client.g.dart';

@injectable
@RestApi()
abstract class ExamsApiClient {
  @factoryMethod
  factory ExamsApiClient(Dio dio) = _ExamsApiClient;

  @GET(AppEndPoints.exams)
  Future<ExamsResponse> getExamsBySubject(
      @Header('token') String token,
      @Query('subject') String subjectId,
      );
}