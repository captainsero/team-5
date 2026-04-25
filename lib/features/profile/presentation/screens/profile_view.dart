import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_5_examapp/core/constants/color_manager.dart';
import 'package:team_5_examapp/features/auth/login/domain/models/user_entity.dart';
import 'package:team_5_examapp/features/profile/presentation/view_model/profile_view_model.dart';
import 'package:team_5_examapp/generated/l10n.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, required this.viewModel});
  final ProfileViewModel viewModel;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final _formKey = GlobalKey<FormState>();

  final _userNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();

    final currentUser = widget.viewModel.state.originalUser;
    if (currentUser != null) {
      _syncControllersFromUser(currentUser);
    } else {
      // Initial fetch from UseCase
      widget.viewModel.getProfileInfo();
    }
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileViewModel, ProfileState>(
      listenWhen: (prev, curr) => prev.originalUser != curr.originalUser,
      listener: (context, state) {
        if (state.originalUser != null) {
          _syncControllersFromUser(state.originalUser!);
        }
        if (state.updateSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(S.of(context).updateSuccessful),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      builder: (context, state) {
        final isInitialLoading =
            state.profileState.isLoading && state.originalUser == null;
        final hasInitialLoadError =
            !state.profileState.isLoading &&
            state.originalUser == null &&
            (state.profileState.errorMessage?.isNotEmpty ?? false);

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              S.of(context).Update,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
          ),
          body: isInitialLoading
              ? const Center(child: CircularProgressIndicator())
              : hasInitialLoadError
              ? _buildInitialLoadError(context, state.profileState.errorMessage!)
              : Form(
                  key: _formKey,
                  child: ListView(
                    padding: const EdgeInsets.all(20),
                    children: [
                      // Avatar logic... (Keep your buildAvatar widget here)
                      const SizedBox(height: 30),

                      _buildTextField(
                        S.of(context).userName,
                        _userNameController,
                        (val) {
                          if (state.editedUser == null) return;
                          context.read<ProfileViewModel>().onProfileChanged(
                            state.editedUser!.copyWith(username: val),
                          );
                        },
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: _buildTextField(
                              S.of(context).firstName,
                              _firstNameController,
                              (val) {
                                if (state.editedUser == null) return;
                                context
                                    .read<ProfileViewModel>()
                                    .onProfileChanged(
                                      state.editedUser!.copyWith(
                                        firstName: val,
                                      ),
                                    );
                              },
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: _buildTextField(
                              S.of(context).lastName,
                              _lastNameController,
                              (val) {
                                if (state.editedUser == null) return;
                                context
                                    .read<ProfileViewModel>()
                                    .onProfileChanged(
                                      state.editedUser!.copyWith(lastName: val),
                                    );
                              },
                            ),
                          ),
                        ],
                      ),

                      _buildTextField(
                        S.of(context).email,
                        _emailController,
                        (val) {
                          if (state.editedUser == null) return;
                          context.read<ProfileViewModel>().onProfileChanged(
                            state.editedUser!.copyWith(email: val),
                          );
                        },
                        keyboard: TextInputType.emailAddress,
                      ),

                      _buildTextField(
                        S.of(context).phone,
                        _phoneController,
                        (val) {
                          if (state.editedUser == null) return;
                          context.read<ProfileViewModel>().onProfileChanged(
                            state.editedUser!.copyWith(phone: val),
                          );
                        },
                        keyboard: TextInputType.phone,
                      ),

                      const SizedBox(height: 40),

                      ElevatedButton(
                        onPressed:
                            (state.editedUser != null &&
                                state.isDirty &&
                                !state.profileState.isLoading)
                            ? () => context
                                  .read<ProfileViewModel>()
                                  .updateProfileInfo()
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          disabledBackgroundColor: Colors.grey[400],
                          minimumSize: const Size.fromHeight(55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: state.profileState.isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                S.of(context).Update,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Widget _buildInitialLoadError(BuildContext context, String errorMessage) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => widget.viewModel.getProfileInfo(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
              ),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  void _syncControllersFromUser(UserEntity user) {
    _userNameController.text = user.username ?? '';
    _firstNameController.text = user.firstName ?? '';
    _lastNameController.text = user.lastName ?? '';
    _emailController.text = user.email ?? '';
    _phoneController.text = user.phone ?? '';
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    Function(String) onChanged, {
    TextInputType? keyboard,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            onChanged: onChanged,
            keyboardType: keyboard,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
