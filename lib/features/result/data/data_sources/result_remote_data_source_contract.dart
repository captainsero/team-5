import 'package:team_5_examapp/config/base_response/base_response.dart';
import '../models/result_dto.dart';

abstract class ResultsRemoteDataSourceContract {
  Future<BaseResponse<List<ResultDto>>> getResults({
    required String token,
  });
}