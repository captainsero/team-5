import 'package:flutter/material.dart';
import '../../../../core/constants/color_manager.dart';
import '../../../../core/constants/font_manager.dart';

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
  bool _showEmailError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),

                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                    labelText: 'Email',

                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24),

                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    labelText: 'Password',

                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),

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
                          'Remember me',style: TextStyle(
                            color: AppColors.black,
                            fontSize: FontSize.s14,
                            fontWeight: FontWeightManager.regular,
                        ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Forget password?',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: FontSize.s14,
                        fontWeight: FontWeightManager.regular,
                        decoration: TextDecoration.underline,
                      ),                    ),
                  ],
                ),
                const SizedBox(height: 48),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showEmailError = true;
                    });
                  },
                  child: const Text('Login'),
                ),
                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text("Don't have an account? ",
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: FontSize.s18,
                        fontWeight: FontWeightManager.regular,

                    ),),
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
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}