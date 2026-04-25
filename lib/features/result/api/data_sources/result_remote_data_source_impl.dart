import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import '../../data/data_sources/result_remote_data_source_contract.dart';
import '../../data/models/result_dto.dart';
import '../result_api_client/result_api_client.dart';


@Injectable(as: ResultsRemoteDataSourceContract)
class ResultsRemoteDataSourceImpl
    implements ResultsRemoteDataSourceContract {
  final ResultsApiClient apiClient;

  ResultsRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<BaseResponse<List<ResultDto>>> getResults({
    required String token,
  }) async {
    try {
      final response = await apiClient.getResults(token);
      return SuccessBaseResponse(data: response.results);
    } catch (e) {
      return ErrorBaseResponse(error: e);
    }
  }
}