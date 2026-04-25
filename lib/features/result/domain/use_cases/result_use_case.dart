import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import '../models/result_model.dart';
import '../repo/result_repo_contract.dart';

@injectable
class GetResultsUseCase {
  final ResultsRepoContract repo;

  GetResultsUseCase({required this.repo});

  Future<BaseResponse<List<ResultModel>>> call({
    required String token,
  }) {
    return repo.getResults(token: token);
  }
}