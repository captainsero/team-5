import 'package:flutter/material.dart';
import 'package:team_5_examapp/core/constants/values_manager.dart';

class ResetPassView extends StatefulWidget {
  const ResetPassView({super.key});

  @override
  State<ResetPassView> createState() => _ResetPassViewState();
}

class _ResetPassViewState extends State<ResetPassView> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        title: Text("Password"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppPadding.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Text(
              "Reset Password",
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            SizedBox(height: AppSize.s16),

            Text(
              "Password must not be empty and must contain 6 characters with upper case letter and one number at least",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            SizedBox(height: AppSize.s30),

            TextFormField(
              controller: _newPasswordController,
              decoration: InputDecoration(
                labelText: "New password",
                hintText: "Enter your password",
              ),
            ),

            SizedBox(height: AppSize.s30),

            TextFormField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: "Confirm password",
                hintText: "Confirm password",
              ),
            ),

            SizedBox(height: AppSize.s30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {}, child: Text("Continue")),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
