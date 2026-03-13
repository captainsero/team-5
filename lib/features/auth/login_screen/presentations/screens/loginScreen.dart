import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_5_examapp/features/auth/login_screen/domain/models/user_model.dart';
import '../../../../../core/constants/color_manager.dart';
import '../../../../../core/constants/font_manager.dart';
import '../../../../../core/constants/values_manager.dart';
import '../../../../../config/base_state/base_state.dart';
import '../../../../../config/app_validator.dart';
import '../view_model/cubit/login_cubit.dart';


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
  Widget build(BuildContext context) {

    return BlocConsumer<LoginViewModel, BaseState<UserModel>>(
      listener: (context, state) {

        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage!)),
          );
        }

        if (state.data != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Welcome ${state.data!.name}")),
          );
        }

      },
      builder: (context, state) {

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).maybePop(),
            ),
            title: const Text("Login"),
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
                        decoration: const InputDecoration(
                          hintText: 'Enter your email',
                          labelText: 'Email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: AppValidator.validateEmail,
                      ),

                      SizedBox(height: AppSize.s16),

                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          labelText: 'Password',

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
                                'Remember me',
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: FontSize.s14,
                                  fontWeight: FontWeightManager.regular,
                                ),
                              ),
                            ],
                          ),

                          Text(
                            'Forget password?',
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
                        onPressed: state.isLoading
                            ? null
                            : () {

                          if (_formKey.currentState!.validate()) {

                            context.read<LoginViewModel>().login(
                              _emailController.text.trim(),
                              _passwordController.text.trim(),
                            );

                          }

                        },
                        child: state.isLoading
                            ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                            : const Text('Login'),
                      ),

                      SizedBox(height: AppSize.s16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: FontSize.s18,
                              fontWeight: FontWeightManager.regular,
                            ),
                          ),

                          Text(
                            'Sign up',
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