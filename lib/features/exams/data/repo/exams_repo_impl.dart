import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/models/exam_model.dart';
import 'package:team_5_examapp/config/models/exams_dto.dart';
import '../data_sources/exams_remote_data_source_contract.dart';
import '../../domain/repo/exams_repo_contract.dart';

@Injectable(as: ExamsRepoContract)
class ExamsRepoImpl implements ExamsRepoContract {
  final ExamsRemoteDataSourceContract remoteDataSource;

  ExamsRepoImpl({required this.remoteDataSource});

  @override
  Future<BaseResponse<List<ExamModel>>> getExamsBySubject({
    required String token,
    required String subjectId,
  }) async {
    final response = await remoteDataSource.getExamsBySubject(
      token: token,
      subjectId: subjectId,
    );

    switch (response) {
      case SuccessBaseResponse<List<ExamDto>>():
        return SuccessBaseResponse(
          data: response.data.map((e) => e.toDomain()).toList(),
        );

      case ErrorBaseResponse<List<ExamDto>>():
        return ErrorBaseResponse(
          errorMessage: response.errorMessage,
        );
    }
  }
}