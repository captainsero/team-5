import 'package:team_5_examapp/config/base_response/base_response.dart';
import '../models/result_model.dart';

abstract class ResultsRepoContract {
  Future<BaseResponse<List<ResultModel>>> getResults({
    required String token,
  });
}