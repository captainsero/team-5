import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/config/base_response/base_response.dart';
import 'package:team_5_examapp/config/base_state/base_state.dart';
import 'package:team_5_examapp/config/response_handler/response_handler.dart';
import 'package:team_5_examapp/config/secure_storage/secure_storage_keys.dart';
import 'package:team_5_examapp/config/secure_storage/secure_storage_service.dart';
import 'package:team_5_examapp/features/auth/login/domain/models/user_entity.dart';
import 'package:team_5_examapp/features/profile/domain/use_case/get_profile_info_use_case.dart';
import 'package:team_5_examapp/features/profile/domain/use_case/update_profile_info_use_case.dart';

import '../../../../config/response_handler/secure_storage_handler.dart';

part 'profile_state.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileState> {
  final GetProfileInfoUseCase getProfileInfoUseCase;
  final UpdateProfileInfoUseCase updateProfileInfoUseCase;

  ProfileViewModel({
    required this.getProfileInfoUseCase,
    required this.updateProfileInfoUseCase,
  }) : super(ProfileState(profileState: BaseState()));

  Future<void> getProfileInfo() async {
    emit(
      state.copyWith(
        profileState: state.profileState.copyWith(
          isLoading: true,
          errorMessage: null,
        ),
      ),
    );

    final token = await SecureStorageService.read(
      key: SecureStorageKeys.userToken,
    );
    final tokenHandler = SecureStorageHandler.handle(token);
    if (!tokenHandler.isSuccess || tokenHandler.data == null) {
      emit(
        state.copyWith(
          profileState: state.profileState.copyWith(
            isLoading: false,
            errorMessage: tokenHandler.errorMessage ?? "Missing auth token",
          ),
        ),
      );
      return;
    }

    final response = await getProfileInfoUseCase.call(token: tokenHandler.data!);
    final handledState = ResponseHandler.handle(response);

    final user = handledState.data;

    emit(
      state.copyWith(
        profileState: handledState,
        originalUser: user,
        editedUser: user,
        isDirty: false,
      ),
    );
  }

  void onProfileChanged(UserEntity updatedUser) {
    if (state.originalUser == null) return;

    // We compare the draft (updatedUser) to the server record (state.originalUser)
    // If they are different, isDirty becomes true and the button turns blue.
    emit(
      state.copyWith(
        editedUser: updatedUser,
        isDirty: updatedUser != state.originalUser,
      ),
    );
  }

  Future<void> updateProfileInfo() async {
    if (state.editedUser == null) return;

    emit(
      state.copyWith(
        profileState: state.profileState.copyWith(isLoading: true),
        updateSuccess: false,
      ),
    );

    final token = await SecureStorageService.read(
      key: SecureStorageKeys.userToken,
    );
    final tokenHandler = SecureStorageHandler.handle(token);
    if (!tokenHandler.isSuccess || tokenHandler.data == null) {
      emit(
        state.copyWith(
          profileState: state.profileState.copyWith(
            isLoading: false,
            errorMessage: tokenHandler.errorMessage ?? "Missing auth token",
          ),
          updateSuccess: false,
        ),
      );
      return;
    }

    final response = await updateProfileInfoUseCase.call(
      token: tokenHandler.data!,
      userEntity: state.editedUser!,
    );

    if (response is SuccessBaseResponse) {
      final updatedData = (response as SuccessBaseResponse<UserEntity>).data;
      emit(
        state.copyWith(
          profileState: ResponseHandler.handle(response),
          originalUser: updatedData, // Update the reference record
          editedUser: updatedData,
          isDirty: false,
          updateSuccess: true,
        ),
      );
    } else {
      emit(
        state.copyWith(
          profileState: ResponseHandler.handle(response),
          updateSuccess: false,
        ),
      );
    }
  }
}
