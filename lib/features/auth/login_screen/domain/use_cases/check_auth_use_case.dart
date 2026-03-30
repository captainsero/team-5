import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/secure_storage/secure_storage_keys.dart';
import 'package:team_5_examapp/config/secure_storage/secure_storage_service.dart';

@injectable
class CheckAuthUseCase {

  Future<bool> call() async {

    final response = await SecureStorageService.read(
      key: SecureStorageKeys.userToken,
    );

    if (response is SuccessBaseResponse<String>) {
      return true;
    }

    return false;
  }
}