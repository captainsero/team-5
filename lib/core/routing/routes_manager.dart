import 'package:go_router/go_router.dart';
import 'package:team_5_examapp/features/auth/register/presentation/screens/register_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";}

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.splashRoute,
    routes: [
      GoRoute(
        path: Routes.registerRoute,
        name: Routes.registerRoute,
        builder: (_, _) => SignUpScreen(),
      ),
    ],
  );
}
