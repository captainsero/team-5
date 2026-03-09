import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:team_5_examapp/config/app_validator.dart';
import 'package:team_5_examapp/config/di/di.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';
import 'package:team_5_examapp/core/routing/routes_manager.dart';
import 'package:team_5_examapp/features/auth/forget_password/presentation/view_model/cubit/forget_pass_view_model.dart';

class ResetPassView extends StatefulWidget {
  const ResetPassView({super.key});

  @override
  State<ResetPassView> createState() => _ResetPassViewState();
}

class _ResetPassViewState extends State<ResetPassView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final ForgetPassViewModel viewModel = getIt.get<ForgetPassViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetPassViewModel>(
      create: (context) => viewModel,
      child: BlocConsumer<ForgetPassViewModel, ForgetPassState>(
        listenWhen: (previous, current) =>
            previous.resetPasswordState.isLoading !=
                current.resetPasswordState.isLoading ||
            previous.resetPasswordState.data !=
                current.resetPasswordState.data ||
            previous.resetPasswordState.errorMessage !=
                current.resetPasswordState.errorMessage,
        listener: (context, state) {
          if (!state.resetPasswordState.isLoading &&
              state.resetPasswordState.data != null &&
              state.resetPasswordState.errorMessage == null) {
            context.go(Routes.loginRoute);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => context.pop(),
                icon: Icon(Icons.arrow_back_ios),
              ),
              title: Text("Password"),
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(AppPadding.p20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Reset Password",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),

                    SizedBox(height: AppSize.s16),

                    Text(
                      "Password must not be empty and must contain 6 characters with upper case letter and one number at least",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),

                    SizedBox(height: AppSize.s30),

                    TextFormField(
                      controller: _newPasswordController,
                      obscureText: true,
                      forceErrorText: state.resetPasswordState.errorMessage,
                      decoration: const InputDecoration(
                        labelText: "New password",
                        hintText: "Enter your password",
                      ),
                      validator: AppValidator.validatePassword,
                      onChanged: (_) {
                        viewModel.clearError();
                      },
                    ),

                    SizedBox(height: AppSize.s30),

                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Confirm password",
                        hintText: "Confirm password",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _newPasswordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: AppSize.s30),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: state.resetPasswordState.isLoading
                            ? null
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  String newPasswrod =
                                      _newPasswordController.text;
                                  await viewModel.resetPassword(
                                    newPassword: newPasswrod.trim(),
                                  );
                                }
                              },
                        child: const Text("Continue"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
