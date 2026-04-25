part of 'profile_view_model.dart';

class ProfileState extends Equatable {
  final BaseState<UserEntity> profileState;
  final UserEntity? originalUser;
  final UserEntity? editedUser;
  final bool isDirty;
  final bool updateSuccess;

  const ProfileState({
    required this.profileState,
    this.originalUser,
    this.editedUser,
    this.isDirty = false,
    this.updateSuccess = false,
  });

  ProfileState copyWith({
    BaseState<UserEntity>? profileState,
    UserEntity? originalUser,
    UserEntity? editedUser,
    bool? isDirty,
    bool? updateSuccess,
  }) {
    return ProfileState(
      profileState: profileState ?? this.profileState,
      originalUser: originalUser ?? this.originalUser,
      editedUser: editedUser ?? this.editedUser,
      isDirty: isDirty ?? this.isDirty,
      updateSuccess: updateSuccess ?? this.updateSuccess,
    );
  }

  @override
  List<Object?> get props => [
    profileState,
    originalUser,
    editedUser,
    isDirty,
    updateSuccess,
  ];
}
