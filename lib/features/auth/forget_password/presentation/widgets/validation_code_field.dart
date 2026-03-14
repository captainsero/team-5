import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:team_5_examapp/config/app_validator.dart';
import 'package:team_5_examapp/config/di/di.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';
import 'package:team_5_examapp/core/routing/routes_manager.dart';
import 'package:team_5_examapp/features/auth/forget_password/presentation/view_model/cubit/forget_pass_view_model.dart';

class ValidationCodeField extends StatefulWidget {
  const ValidationCodeField({super.key});

  @override
  State<ValidationCodeField> createState() => _ValidationCodeFieldState();
}

class _ValidationCodeFieldState extends State<ValidationCodeField> {
  final _formKey = GlobalKey<FormState>();
  final _pinController = TextEditingController();
  final _focusNode = FocusNode();
  final viewModel = getIt.get<ForgetPassViewModel>();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: AppSize.s50,
      height: AppSize.s70,
      textStyle: Theme.of(context).textTheme.titleSmall,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(RadiusSize.r10),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
          width: AppSize.s1,
        ),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      borderRadius: BorderRadius.circular(RadiusSize.r10),
      border: Border.all(
        color: Theme.of(context).colorScheme.primary,
        width: AppSize.s1,
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyDecorationWith(
      borderRadius: BorderRadius.circular(RadiusSize.r10),
      border: Border.all(
        color: Theme.of(context).colorScheme.primary,
        width: AppSize.s1,
      ),
    );

    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      borderRadius: BorderRadius.circular(RadiusSize.r10),
      border: Border.all(
        color: Theme.of(context).colorScheme.error,
        width: AppSize.s1,
      ),
    );

    return BlocProvider<ForgetPassViewModel>(
      create: (context) => viewModel,
      child: BlocConsumer<ForgetPassViewModel, ForgetPassState>(
        listenWhen: (previous, current) =>
            previous.confirmValidationState != current.confirmValidationState,
        listener: (context, state) {
          // navigate on success
          if (!state.confirmValidationState.isLoading &&
              state.confirmValidationState.data != null &&
              state.confirmValidationState.errorMessage == null) {
            context.push(Routes.resetPassRoute);
          }
        },
        buildWhen: (previous, current) =>
            previous.confirmValidationState != current.confirmValidationState,
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Pinput(
              controller: _pinController,
              focusNode: _focusNode,
              autofocus: true,
              length: 6,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              errorPinTheme: errorPinTheme,
              keyboardType: TextInputType.number,
              showCursor: true,
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              forceErrorState:
                  state.confirmValidationState.errorMessage != null,
              errorText: state.confirmValidationState.errorMessage,
              validator: AppValidator.validateOtpCode,
              onChanged: (_) {
                if (state.confirmValidationState.errorMessage != null) {
                  viewModel.clearError();
                }
              },
              onCompleted: (pin) async {
                if (_formKey.currentState!.validate()) {
                  String resetCode = pin;
                  await viewModel.confirmValidationCode(resetCode: resetCode);
                }
              },
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pinController.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
