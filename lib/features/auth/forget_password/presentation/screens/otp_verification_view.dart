import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:team_5_examapp/core/constants/font_manager.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';
import 'package:team_5_examapp/features/auth/forget_password/presentation/view_model/cubit/forget_pass_view_model.dart';
import 'package:team_5_examapp/features/auth/forget_password/presentation/widgets/otp_code_field.dart';
import 'package:team_5_examapp/generated/l10n.dart';

class OtpVerificationView extends StatefulWidget {
  const OtpVerificationView({super.key, required this.forgetPassViewModel});
  final ForgetPassViewModel forgetPassViewModel;

  @override
  State<OtpVerificationView> createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> {
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppPadding.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Text(
              S.of(context).emailVerification,
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            SizedBox(height: AppSize.s16),

            Text(
              S.of(context).emailVerificationDis,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            SizedBox(height: AppSize.s30),

            OtpCodeField(forgetPassViewModel: widget.forgetPassViewModel),

            SizedBox(height: AppSize.s30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).didnotReceiveCode,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall!.copyWith(fontSize: FontSize.s16),
                ),
                TextButton(
                  onPressed: () async =>
                      await widget.forgetPassViewModel.resendCode(),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(AppSize.s0, AppSize.s0),
                  ),
                  child: Text(
                    S.of(context).resend,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Theme.of(
                        context,
                      ).colorScheme.primary, // optional
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
