import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:team_5_examapp/config/app_validator.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';

class ValidationCodeField extends StatefulWidget {
  const ValidationCodeField({super.key});

  @override
  State<ValidationCodeField> createState() => _ValidationCodeFieldState();
}

class _ValidationCodeFieldState extends State<ValidationCodeField> {
  final _formKey = GlobalKey<FormState>();
  final _pinController = TextEditingController();
  final _focusNode = FocusNode();

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

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Pinput(
            controller: _pinController,
            focusNode: _focusNode,
            length: 6,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            submittedPinTheme: submittedPinTheme,
            errorPinTheme: errorPinTheme,
            keyboardType: TextInputType.number,
            showCursor: true,
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            validator: AppValidator.validateOtpCode,
            onCompleted: (pin) {
              //TODO: Handel API Error State
              _formKey.currentState!.validate();
            },
          ),
        ],
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
