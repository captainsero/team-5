import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../data/models/responses/result_response.dart';

part 'result_api_client.g.dart';

@injectable
@RestApi()
abstract class ResultsApiClient {
  @factoryMethod
  factory ResultsApiClient(Dio dio) = _ResultsApiClient;

  @GET("/results")
  Future<ResultsResponse> getResults(
      @Header('token') String token,
      );
}