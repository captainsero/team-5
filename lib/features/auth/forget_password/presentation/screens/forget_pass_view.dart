import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:team_5_examapp/config/app_validator.dart';
import 'package:team_5_examapp/config/di/di.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';
import 'package:team_5_examapp/core/routing/routes_manager.dart';
import 'package:team_5_examapp/features/auth/forget_password/presentation/view_model/cubit/forget_pass_view_model.dart';

class ForgetPassView extends StatefulWidget {
  const ForgetPassView({super.key});

  @override
  State<ForgetPassView> createState() => _ForgetPassViewState();
}

class _ForgetPassViewState extends State<ForgetPassView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  ForgetPassViewModel viewModel = getIt.get<ForgetPassViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetPassViewModel>(
      create: (context) => viewModel,
      child: BlocConsumer<ForgetPassViewModel, ForgetPassState>(
        listenWhen: (previous, current) =>
            previous.forgetPasswordState.isLoading !=
                current.forgetPasswordState.isLoading ||
            previous.forgetPasswordState.data !=
                current.forgetPasswordState.data ||
            previous.forgetPasswordState.errorMessage !=
                current.forgetPasswordState.errorMessage,
        listener: (context, state) {
          if (!state.forgetPasswordState.isLoading &&
              state.forgetPasswordState.data != null &&
              state.forgetPasswordState.errorMessage == null) {
            context.push(Routes.validationCodeRoute);
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
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(AppPadding.p20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Text(
                      "Forget Password",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),

                    SizedBox(height: AppSize.s16),

                    Text(
                      "Please enter your email associated to your account",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),

                    SizedBox(height: AppSize.s30),

                    TextFormField(
                      controller: _emailController,
                      forceErrorText: state.forgetPasswordState.errorMessage,
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Enter your email",
                      ),
                      validator: AppValidator.validateEmail,
                      onChanged: (value) {
                        viewModel.clearError();
                      },
                    ),

                    SizedBox(height: AppSize.s30),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: state.forgetPasswordState.isLoading
                            ? null
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  String email = _emailController.text;
                                  await viewModel.forgetPassword(email: email);
                                }
                              },
                        child: Text("Continue"),
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
    _emailController.dispose();
    super.dispose();
  }
}
