import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/models/get_all_subjects_response/subject_dto/subject_dto.dart';
import 'package:team_5_examapp/features/subjects_portal/api/subjects_portal_api_client/subjects_portal_api_client.dart';
import 'package:team_5_examapp/features/subjects_portal/data/data%20sources_contracts/subjects_portal_remote_data_source_contract.dart';

@Injectable(as: SubjectsPortalRemoteDataSourceContract)
class SubjectsPortalRemoteDataSourceImpl
    implements SubjectsPortalRemoteDataSourceContract {
  final SubjectsPortalApiClient subjectsPortalApiClient;

  SubjectsPortalRemoteDataSourceImpl({required this.subjectsPortalApiClient});

  @override
  Future<BaseResponse<List<SubjectDto>>> getAllSubjects({
    required String token,
  }) async {
    try {
      final response = await subjectsPortalApiClient.getAllSubjects(
        token: token,
      );
      return SuccessBaseResponse<List<SubjectDto>>(data: response.subjects);
    } catch (e) {
      return ErrorBaseResponse<List<SubjectDto>>(
        error: e,
        errorMessage: e.toString(),
      );
    }
  }
}
