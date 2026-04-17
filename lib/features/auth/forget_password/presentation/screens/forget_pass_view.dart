import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:team_5_examapp/config/app_validator.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';
import 'package:team_5_examapp/core/routing/routes_path.dart';
import 'package:team_5_examapp/features/auth/forget_password/presentation/view_model/cubit/forget_pass_view_model.dart';
import 'package:team_5_examapp/generated/l10n.dart';

class ForgetPassView extends StatefulWidget {
  const ForgetPassView({super.key, required this.forgetPassViewModel});
  final ForgetPassViewModel forgetPassViewModel;

  @override
  State<ForgetPassView> createState() => _ForgetPassViewState();
}

class _ForgetPassViewState extends State<ForgetPassView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    _loadEmail();
  }

  Future<void> _loadEmail() async {
    if (!mounted) return;
    String email = await widget.forgetPassViewModel.getUserEmail();
    _emailController.text = email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(S.of(context).passwrod),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppPadding.p20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Text(
                S.of(context).forgetPassword,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              SizedBox(height: AppSize.s16),

              Text(
                S.of(context).forgetPasswordDis,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              SizedBox(height: AppSize.s30),

              BlocBuilder<ForgetPassViewModel, ForgetPassState>(
                buildWhen: (previous, current) =>
                    previous.forgetPasswordState != current.forgetPasswordState,
                builder: (context, state) {
                  return Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: S.of(context).email,
                          hintText: S.of(context).enterYourEmail,
                        ),
                        validator: AppValidator.validateEmail,
                      ),

                      if (state.forgetPasswordState.errorMessage != null &&
                          state.forgetPasswordState.isLoading)
                        Text(
                          state.forgetPasswordState.errorMessage ?? '',
                          style: Theme.of(context).textTheme.bodyLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.error,
                              ),
                        ),
                    ],
                  );
                },
              ),

              SizedBox(height: AppSize.s30),

              BlocConsumer<ForgetPassViewModel, ForgetPassState>(
                listenWhen: (previous, current) =>
                    previous.forgetPasswordState != current.forgetPasswordState,
                listener: (context, state) {
                  if (!state.forgetPasswordState.isLoading &&
                      state.forgetPasswordState.data != null &&
                      state.forgetPasswordState.errorMessage == null) {
                    context.push(
                      RoutesPath.otpVerificationRoute,
                      extra: widget.forgetPassViewModel,
                    );
                  }
                },
                buildWhen: (previous, current) =>
                    previous.forgetPasswordState != current.forgetPasswordState,
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: state.forgetPasswordState.isLoading
                          ? null
                          : () async {
                              if (_formKey.currentState!.validate()) {
                                String email = _emailController.text;
                                await widget.forgetPassViewModel.forgetPassword(
                                  email: email,
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
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
