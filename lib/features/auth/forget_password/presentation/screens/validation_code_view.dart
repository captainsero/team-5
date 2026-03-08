import 'package:flutter/material.dart';
import 'package:team_5_examapp/core/constants/font_manager.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';

class ValidationCodeView extends StatefulWidget {
  const ValidationCodeView({super.key});

  @override
  State<ValidationCodeView> createState() => _ValidationCodeViewState();
}

class _ValidationCodeViewState extends State<ValidationCodeView> {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
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
                "Email verification",
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              SizedBox(height: AppSize.s16),

              Text(
                "Please enter your code that send to your email adress",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),

              SizedBox(height: AppSize.s30),

              TextFormField(controller: _codeController),

              SizedBox(height: AppSize.s30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive code? ",
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall!.copyWith(fontSize: FontSize.s16),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(AppSize.s0, AppSize.s0),
                    ),
                    child: Text(
                      "Resend",
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
      ),
    );
  }
}
