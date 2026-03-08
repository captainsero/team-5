import 'package:go_router/go_router.dart';
import 'package:team_5_examapp/features/auth/forget_password/presentation/screens/forget_pass_view.dart';
import 'package:team_5_examapp/features/auth/forget_password/presentation/screens/validation_code_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String validationCodeRoute = "/validationCode";
}

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.validationCodeRoute,
    routes: [
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
    ],
  );
}
