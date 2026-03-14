import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_5_examapp/config/app_validator.dart';
import 'package:team_5_examapp/core/constants/color_manager.dart';
import 'package:team_5_examapp/core/constants/font_manager.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';
import 'package:team_5_examapp/features/auth/login_screen/domain/models/user_model.dart';
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

  bool _rememberMe = false;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    // Load saved email if exists
    final cubit = context.read<LoginViewModel>();
    cubit.loadSavedEmail().then((email) {
      if (email != null) {
        _emailController.text = email;
        setState(() {
          _rememberMe = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginViewModel, LoginState>(
      listener: (context, state) {
        final loginState = state.loginState;

        if (loginState.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(loginState.errorMessage!)),
          );
        }

        if (loginState.data != null) {
          // Navigate to home or dashboard
          // Navigator.of(context).pushReplacementNamed('/home');
        }
      },
      builder: (context, state) {
        final loginState = state.loginState;

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
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: AppValidator.validateEmail,
                      ),
                      SizedBox(height: AppSize.s16),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          hintText: S.of(context).enterPassword,
                          labelText: S.of(context).password,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        validator: AppValidator.validatePassword,
                      ),
                      SizedBox(height: AppSize.s16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value ?? false;
                                  });
                                },
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
                            context.read<LoginViewModel>().login(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                              // rememberMe: _rememberMe,
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
                          Text(
                            S.of(context).signUp,
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: FontSize.s18,
                              fontWeight: FontWeightManager.medium,
                              decoration: TextDecoration.underline,
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}