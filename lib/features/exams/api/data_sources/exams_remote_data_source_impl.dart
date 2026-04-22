import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/models/exams_dto.dart';
import '../../data/data_sources/exams_remote_data_source_contract.dart';
import '../exams_api_client/exams_api_client.dart';

@Injectable(as: ExamsRemoteDataSourceContract)
class ExamsRemoteDataSourceImpl
    implements ExamsRemoteDataSourceContract {
  final ExamsApiClient apiClient;

  ExamsRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<BaseResponse<List<ExamDto>>> getExamsBySubject({
    required String token,
    required String subjectId,
  }) async {
    try {
      final response = await apiClient.getExamsBySubject(token, subjectId);
      return SuccessBaseResponse(data: response.exams);
    } catch (e) {
      return ErrorBaseResponse(error: e);
    }
  }
}