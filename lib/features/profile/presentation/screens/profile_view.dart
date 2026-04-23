import 'package:flutter/material.dart';
import 'package:team_5_examapp/core/constants/color_manager.dart';
import 'package:team_5_examapp/features/profile/presentation/Widgets/build_circular_avatar.dart';
import 'package:team_5_examapp/features/profile/presentation/Widgets/build_label_text_field.dart';
import 'package:team_5_examapp/features/profile/presentation/Widgets/build_password_field.dart';
import 'package:team_5_examapp/features/profile/presentation/Widgets/build_text_field.dart';
import 'package:team_5_examapp/features/profile/presentation/view_model/profile_view_model.dart';
import 'package:team_5_examapp/generated/l10n.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key? key, required this.viewModel}) : super(key: key);

  final ProfileViewModel viewModel;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final _formKey = GlobalKey<FormState>();

  // Controllers to handle text input
  late TextEditingController _userNameController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  bool _isUpdated = false;

  @override
  void initState() {
    super.initState();
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
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          _isUpdated ? 'Profile' : ' Edit Profile',
          style: theme.textTheme.headlineLarge,
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      const SizedBox(height: 24),
                      buildAvatar(theme),
                      const SizedBox(height: 24),
                      buildLabel(S.of(context).userName),
                      buildTextField(_userNameController),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildLabel(S.of(context).firstName),
                                buildTextField(_firstNameController),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildLabel(S.of(context).lastName),
                                buildTextField(_lastNameController),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      buildLabel(S.of(context).email),
                      buildTextField(
                        _emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 12),
                      buildLabel(S.of(context).password),
                      buildPasswordBox(context),
                      const SizedBox(height: 12),
                      buildLabel(S.of(context).phone),
                      buildTextField(
                        _phoneController,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: _isUpdated ? updateProfile : null,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          minimumSize: const Size.fromHeight(50),
                          backgroundColor: _isUpdated
                              ? AppColors.primary
                              : Colors.grey[400],
                          disabledBackgroundColor: Colors.grey[300],
                        ),
                        child: Text(
                          S.of(context).Update,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
