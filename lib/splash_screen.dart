import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:team_5_examapp/config/di/di.dart';
import 'package:team_5_examapp/core/routing/routes_path.dart';
import 'package:team_5_examapp/features/auth/login/domain/use_cases/check_auth_use_case.dart';

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
      context.go(RoutesPath.loginRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
