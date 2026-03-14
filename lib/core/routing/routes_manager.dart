import 'package:go_router/go_router.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
}

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.splashRoute,
    routes: [
    ],
  );
}
