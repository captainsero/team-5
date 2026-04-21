import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/shared_models/get_all_subjects_response/subject_dto/subject_dto.dart';
import 'package:team_5_examapp/features/subjects_portal/data/data%20sources_contracts/subjects_portal_remote_data_source_contract.dart';
import 'package:team_5_examapp/features/subjects_portal/domain/models/subject_model.dart';
import 'package:team_5_examapp/features/subjects_portal/domain/repo/subjects_portal_repo_contract.dart';

@Injectable(as: SubjectsPortalRepoContract)
class SubjectsPortalRepoimpl implements SubjectsPortalRepoContract {
  final SubjectsPortalRemoteDataSourceContract
  subjectsPortalRemoteDataSourceContract;

  SubjectsPortalRepoimpl({
    required this.subjectsPortalRemoteDataSourceContract,
  });
  @override
  Future<BaseResponse<List<SubjectModel>>> getAllSubjects({
    required String token,
  }) async {
    final subjectDtos = await subjectsPortalRemoteDataSourceContract
        .getAllSubjects(token: token);

    switch (subjectDtos) {
      case SuccessBaseResponse<List<SubjectDto>>():
        final subjects = subjectDtos.data
            .map((subjectDto) => SubjectModel.fromDTO(subjectDto))
            .toList();
        return SuccessBaseResponse<List<SubjectModel>>(data: subjects);
      case ErrorBaseResponse<List<SubjectDto>>():
        return ErrorBaseResponse<List<SubjectModel>>(
          errorMessage: subjectDtos.errorMessage,
        );
    }
  }
}
