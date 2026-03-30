import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:team_5_examapp/config/app_validator.dart';
import 'package:team_5_examapp/config/di/di.dart';
import 'package:team_5_examapp/core/constants/color_manager.dart';
import 'package:team_5_examapp/core/constants/font_manager.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';
import 'package:team_5_examapp/core/routing/routes_manager.dart';
import 'package:team_5_examapp/features/auth/login_screen/presentations/view_model/cubit/login_view_model.dart';
import 'package:team_5_examapp/generated/l10n.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final loginViewModel = getIt.get<LoginViewModel>();

  /// ✅ CHANGE 1:
  /// نقل loadSavedEmail من build إلى initState
  /// لأن build بيتنفذ مرات كثيرة وده كان bug

  @override
  void initState() {
    super.initState();

    loginViewModel.loadSavedEmail().then((_) {
      final savedEmail = loginViewModel.state.savedEmail;

      if (savedEmail != null) {
        _emailController.text = savedEmail;
      }
    });
  }

  /// ✅ CHANGE 2:
  /// Dispose controllers لتجنب memory leak

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginViewModel>(
      create: (context) => loginViewModel,

      child: BlocConsumer<LoginViewModel, LoginState>(
        listener: (context, state) {
          if (state.loginState.data != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Login successful! Welcome")),
            );

            FocusScope.of(context).unfocus();

            // ????????????????????context.go(Routes.homeRoute);
          }
        },

        listenWhen: (previous, current) =>
            previous.loginState != current.loginState,

        builder: (context, state) {
          final loginState = state.loginState;
          final showErrors = state.isLoginAttempted;

          return Scaffold(
            appBar: AppBar(
              titleSpacing: AppSize.s20,

              title: Text(
                S.of(context).login,
                style: Theme.of(context).textTheme.titleLarge,
              ),
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
                          ),

                          keyboardType: TextInputType.emailAddress,

                          autovalidateMode: showErrors
                              ? AutovalidateMode.onUserInteraction
                              : AutovalidateMode.disabled,

                          validator: (value) =>
                              AppValidator.validateEmail(value),

                          onChanged: (value) {
                            loginViewModel.clearError();
                          },
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
                          ),

                          autovalidateMode: showErrors
                              ? AutovalidateMode.onUserInteraction
                              : AutovalidateMode.disabled,

                          validator: (value) =>
                              AppValidator.validatePassword(value),

                          onChanged: (value) {
                            loginViewModel.clearError();
                          },
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
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),

                            TextButton(
                              onPressed: () {
                                context.push(Routes.forgetPasswordRoute);
                              },

                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),

                              child: Text(
                                S.of(context).forgetPassword,

                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: AppSize.s16),

                        if (loginState.errorMessage != null)
                          Padding(
                            padding: EdgeInsets.only(bottom: AppSize.s16),

                            child: Text(
                              loginState.errorMessage!,

                              style: const TextStyle(color: Colors.red),

                              textAlign: TextAlign.center,
                            ),
                          ),

                        SizedBox(height: AppSize.s30),

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
                              ? SizedBox(
                                  height: AppSize.s20,
                                  width: AppSize.s20,

                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: AppSize.s2,
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

                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(fontSize: FontSize.s18),
                            ),

                            SizedBox(width: AppSize.s2),

                            GestureDetector(
                              onTap: () => context.push(Routes.registerRoute),

                              child: Text(
                                S.of(context).signUp,

                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(
                                      color: AppColors.primary,
                                      fontSize: FontSize.s18,
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
      ),
    );
  }
}
