import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:team_5_examapp/config/di/di.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';
import 'package:team_5_examapp/core/routing/routes_path.dart';
import 'package:team_5_examapp/features/auth/register/data/models/user_request_dto.dart';
import 'package:team_5_examapp/features/auth/register/presentation/view_model/register_view_model.dart';

import '../../../../../config/app_validator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();
  RegisterViewModel viewModel = getIt.get<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterViewModel>(
      create: (context) => viewModel,
      child: BlocConsumer<RegisterViewModel, RegisterState>(
        listenWhen: (previous, current) =>
            previous.registerUserState != current.registerUserState,
        listener: (context, state) {
          if (!state.registerUserState.isLoading &&
              state.registerUserState.data != null &&
              state.registerUserState.errorMessage == null) {
            context.go(RoutesPath.loginRoute);
          }
        },
        buildWhen: (previous, current) =>
            previous.registerUserState != current.registerUserState,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: context.pop,
              ),
              title: const Text('Sign Up'),
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(AppPadding.p20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // User Name
                    TextFormField(
                      controller: _userNameController,
                      validator: AppValidator.validateName,
                      decoration: InputDecoration(
                        labelText: 'User name',
                        hintText: "Enter your user name",
                      ),
                      onChanged: (value) => viewModel.clearError(),
                    ),
                    const SizedBox(height: 16),

                    // First Name & Last Name (Row)
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _firstNameController,
                            validator: AppValidator.validateName,
                            decoration: InputDecoration(
                              labelText: 'First name',
                              hintText: "Enter your First Name",
                            ),

                            onChanged: (value) => viewModel.clearError(),
                          ),
                        ),
                        const SizedBox(width: 16),

                        Expanded(
                          child: TextFormField(
                            controller: _lastNameController,
                            validator: AppValidator.validateName,
                            decoration: InputDecoration(
                              labelText: 'Last name',
                              hintText: "Enter your last name",
                            ),

                            onChanged: (value) => viewModel.clearError(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Email
                    TextFormField(
                      controller: _emailController,
                      validator: AppValidator.validateEmail,
                      forceErrorText: state.registerUserState.errorMessage,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: "Enter your Email",
                      ),
                      onChanged: (value) => viewModel.clearError(),
                    ),
                    const SizedBox(height: 16),

                    // Password & Confirm Password (Row)
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _passwordController,
                            validator: AppValidator.validatePassword,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: "Enter your Password",
                            ),

                            onChanged: (value) => viewModel.clearError(),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            controller: _confirmPasswordController,
                            validator: (value) =>
                                AppValidator.validateConfirmPassword(
                                  value,
                                  _passwordController.text,
                                ),

                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Confirm password',
                              hintText: "Confirm your Password",
                            ),

                            onChanged: (value) => viewModel.clearError(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Phone
                    TextFormField(
                      controller: _phoneController,
                      validator: AppValidator.validatePhone,
                      decoration: InputDecoration(
                        labelText: 'Phone number',
                        hintText: "Enter your phone number",
                      ),
                      onChanged: (value) => viewModel.clearError(),
                    ),
                    SizedBox(height: AppSize.s30),
                    // Sign Up Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: state.registerUserState.isLoading
                            ? null
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  await viewModel.registerUser(
                                    userInfo: UserRequestDto(
                                      username: _userNameController.text,
                                      firstName: _firstNameController.text,
                                      lastName: _lastNameController.text,
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      rePassword:
                                          _confirmPasswordController.text,
                                      phone: _phoneController.text,
                                    ),
                                  );
                                }
                              },
                        child: Text("Sign Up"),
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
}
