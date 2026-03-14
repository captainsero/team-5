import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_5_examapp/config/app_validator.dart';
import 'package:team_5_examapp/core/constants/color_manager.dart';
import 'package:team_5_examapp/core/constants/font_manager.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';
import 'package:team_5_examapp/features/auth/login_screen/presentations/view_model/cubit/login_view_model.dart';
import 'package:team_5_examapp/generated/l10n.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    final loginViewModel = context.read<LoginViewModel>();
    loginViewModel.loadSavedEmail().then((_) {
      if (loginViewModel.state.savedEmail != null) {
        _emailController.text = loginViewModel.state.savedEmail!;
      }
    });

    return BlocConsumer<LoginViewModel, LoginState>(
      listener: (context, state) {
        if (state.loginState.data != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Login successful! Welcome")));
        }
      },
      builder: (context, state) {
        final loginState = state.loginState;
        final showErrors = state.isLoginAttempted;

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).maybePop(),
            ),
            title: Text(S.of(context).login),
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(AppPadding.p20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: AppSize.s20),

                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: S.of(context).enterYourEmail,
                          labelText: S.of(context).email,
                          errorText: showErrors
                              ? loginViewModel.state.emailError ??
                                    loginState.errorMessage
                              : null,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode: AutovalidateMode.disabled,
                        validator: AppValidator.validateEmail,
                      ),
                      SizedBox(height: AppSize.s16),

                      TextFormField(
                        controller: _passwordController,
                        obscureText: state.obscurePassword,
                        decoration: InputDecoration(
                          hintText: S.of(context).enterPassword,
                          labelText: S.of(context).password,
                          suffixIcon: IconButton(
                            icon: Icon(
                              state.obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              loginViewModel.toggleObscurePassword();
                            },
                          ),
                          errorText: showErrors ? state.passwordError : null,
                        ),
                        autovalidateMode: AutovalidateMode.disabled,
                        validator: AppValidator.validatePassword,
                      ),
                      SizedBox(height: AppSize.s16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: state.rememberMe,
                                onChanged: (_) =>
                                    loginViewModel.toggleRememberMe(),
                                activeColor: AppColors.primary,
                                visualDensity: VisualDensity.compact,
                              ),
                              Text(
                                S.of(context).rememberMe,
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: FontSize.s14,
                                  fontWeight: FontWeightManager.regular,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            S.of(context).forgetPassword,
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: FontSize.s14,
                              fontWeight: FontWeightManager.regular,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSize.s48),

                      ElevatedButton(
                        onPressed: loginState.isLoading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  loginViewModel.login(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim(),
                                    rememberMe: state.rememberMe,
                                  );
                                }
                              },
                        child: loginState.isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(S.of(context).login),
                      ),
                      SizedBox(height: AppSize.s16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            S.of(context).dontHaveAccount,
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: FontSize.s18,
                              fontWeight: FontWeightManager.regular,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              S.of(context).signUp,
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: FontSize.s18,
                                fontWeight: FontWeightManager.medium,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSize.s20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
