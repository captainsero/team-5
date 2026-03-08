import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/features/auth/forget_password/data/models/responses/forget_password_response.dart';
import 'package:team_5_examapp/features/auth/forget_password/domain/repo/forget_pass_repo_contract.dart';

@injectable
class ConfirmValidationCodeUseCase {
  final ForgetPassRepoContract forgetPassRepo;

  ConfirmValidationCodeUseCase({required this.forgetPassRepo});

  Future<BaseResponse<ForgetPasswordResponse>> call({
    required String resetCode,
  }) async {
    return await forgetPassRepo.confirmValidationCode(resetCode: resetCode);
  }
}
