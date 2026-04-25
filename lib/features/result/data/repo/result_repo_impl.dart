import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import '../../domain/models/result_model.dart';
import '../../domain/repo/result_repo_contract.dart';
import '../data_sources/result_remote_data_source_contract.dart';
import '../models/result_dto.dart';

@Injectable(as: ResultsRepoContract)
class ResultsRepoImpl implements ResultsRepoContract {
  final ResultsRemoteDataSourceContract remoteDataSource;

  ResultsRepoImpl({required this.remoteDataSource});

  @override
  Future<BaseResponse<List<ResultModel>>> getResults({
    required String token,
  }) async {
    final response = await remoteDataSource.getResults(token: token);

    switch (response) {
      case SuccessBaseResponse<List<ResultDto>>():
        return SuccessBaseResponse(
          data: response.data.map((e) => e.toDomain()).toList(),
        );

      case ErrorBaseResponse<List<ResultDto>>():
        return ErrorBaseResponse(
          errorMessage: response.errorMessage,
        );
    }
  }
}