import 'package:go_router/go_router.dart';
import 'package:team_5_examapp/features/auth/forget_password/presentation/screens/forget_pass_view.dart';
import 'package:team_5_examapp/features/auth/forget_password/presentation/screens/reset_pass_view.dart';
import 'package:team_5_examapp/features/auth/forget_password/presentation/screens/validation_code_view.dart';
import 'package:team_5_examapp/features/auth/loginScreen/presentations/loginScreen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String validationCodeRoute = "/validationCode";
  static const String resetPassRoute = "/resetPass";
  static const String registerRoute = "/register";
}

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.loginRoute,
    routes: [
      GoRoute(
        path: Routes.loginRoute,
        name: Routes.loginRoute,
        builder: (_, _) => LoginScreen(),
      ),
      GoRoute(
        path: Routes.forgetPasswordRoute,
        name: Routes.forgetPasswordRoute,
        builder: (_, _) => ForgetPassView(),
      ),
      GoRoute(
        path: Routes.validationCodeRoute,
        name: Routes.validationCodeRoute,
        builder: (_, _) => ValidationCodeView(),
      ),
      GoRoute(
        path: Routes.resetPassRoute,
        name: Routes.resetPassRoute,
        builder: (_, _) => ResetPassView(),
      ),
    ],
  );
}
