import 'package:go_router/go_router.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String registerRoute = "/register";
}

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.splashRoute,
    routes: [
    ],
  );
}
