import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:team_5_examapp/config/app_validator.dart';
import 'package:team_5_examapp/config/di/di.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';
import 'package:team_5_examapp/core/routing/routes_path.dart';
import 'package:team_5_examapp/features/auth/forget_password/presentation/view_model/cubit/forget_pass_view_model.dart';
import 'package:team_5_examapp/generated/l10n.dart';

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
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text(S.of(context).passwrod),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(AppPadding.p20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  S.of(context).resetPassword,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),

                SizedBox(height: AppSize.s16),

                Text(
                  S.of(context).resetPasswordDis,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),

                SizedBox(height: AppSize.s30),

                BlocBuilder<ForgetPassViewModel, ForgetPassState>(
                  buildWhen: (previous, current) =>
                      previous.resetPasswordState != current.resetPasswordState,
                  builder: (context, state) {
                    return TextFormField(
                      controller: _newPasswordController,
                      obscureText: true,
                      forceErrorText: state.resetPasswordState.errorMessage,
                      decoration: InputDecoration(
                        labelText: S.of(context).newPassword,
                        hintText: S.of(context).enterYourPassword,
                      ),
                      validator: AppValidator.validatePassword,
                      onChanged: (_) {},
                    );
                  },
                ),

                SizedBox(height: AppSize.s30),

                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: S.of(context).confirmPassword,
                    hintText: S.of(context).confirmPassword,
                  ),
                  validator: (value) => AppValidator.validateConfirmPassword(
                    value,
                    _newPasswordController.text,
                  ),
                ),

                SizedBox(height: AppSize.s30),

                BlocConsumer<ForgetPassViewModel, ForgetPassState>(
                  listenWhen: (previous, current) =>
                      previous.resetPasswordState != current.resetPasswordState,
                  listener: (context, state) {
                    if (!state.resetPasswordState.isLoading &&
                        state.resetPasswordState.data != null &&
                        state.resetPasswordState.errorMessage == null) {
                      context.go(RoutesPath.loginRoute);
                    }
                  },
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: state.resetPasswordState.isLoading
                            ? null
                            : () async {
                                //TODO: solve the validation error
                                await viewModel.clearError();
                                if (_formKey.currentState!.validate()) {
                                  String newPasswrod =
                                      _newPasswordController.text;
                                  await viewModel.resetPassword(
                                    newPassword: newPasswrod.trim(),
                                  );
                                }
                              },
                        child: Text(S.of(context).continueButton),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
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
