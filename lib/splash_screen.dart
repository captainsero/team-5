import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:team_5_examapp/core/routing/routes_manager.dart';

import 'config/di/di.dart';
import 'features/auth/login_screen/domain/use_cases/check_auth_use_case.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final checkAuthUseCase = getIt.get<CheckAuthUseCase>();

  @override
  void initState() {
    super.initState();

    _checkLogin();
  }

  Future<void> _checkLogin() async {
    await Future.delayed(const Duration(seconds: 2));

    final isLoggedIn = await checkAuthUseCase();

    if (!mounted) return;

    //token exists
    if (isLoggedIn) {
      // ??????????????????????????context.go(Routes.homeRoute);
    } else {
      // no token
      context.go(Routes.loginRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
