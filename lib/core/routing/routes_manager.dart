import 'package:go_router/go_router.dart';
import 'package:team_5_examapp/core/routing/routes_path.dart';
import 'package:team_5_examapp/features/auth/forget_password/presentation/screens/forget_pass_view.dart';
import 'package:team_5_examapp/features/auth/forget_password/presentation/screens/reset_pass_view.dart';
import 'package:team_5_examapp/features/auth/forget_password/presentation/screens/otp_verification_view.dart';
import 'package:team_5_examapp/features/auth/login/presentations/screens/login_screen.dart';
import 'package:team_5_examapp/features/auth/register/presentation/screens/register_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RoutesPath.loginRoute,
    routes: [
      GoRoute(
        path: RoutesPath.registerRoute,
        name: RoutesPath.registerRoute,
        builder: (_, _) => SignUpScreen(),
      ),
      GoRoute(
        path: RoutesPath.loginRoute,
        name: RoutesPath.loginRoute,
        builder: (_, _) => LoginScreen(),
      ),
      GoRoute(
        path: RoutesPath.forgetPasswordRoute,
        name: RoutesPath.forgetPasswordRoute,
        builder: (_, _) => ForgetPassView(),
      ),
      GoRoute(
        path: RoutesPath.otpVerificationRoute,
        name: RoutesPath.otpVerificationRoute,
        builder: (_, _) => OtpVerificationView(),
      ),
      GoRoute(
        path: RoutesPath.resetPassRoute,
        name: RoutesPath.resetPassRoute,
        builder: (_, _) => ResetPassView(),
      ),
    ],
  );
}
