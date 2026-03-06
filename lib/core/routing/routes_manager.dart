import 'package:go_router/go_router.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String signupRoute = "/signup";
  static const String forgetPasswordRoute = "/forgetPassword";
  static const String verificationCodeRoute = "/verificationCode";
  static const String resetAfterVerificationRoute = "/resetAfterVerification";
  static const String profileRoute = "/profile";
  static const String resetPasswordRoute = "/resetPassword";
  static const String exploreRoute = "/explore";
  static const String languagesRoute = "/languages";
  static const String examRoute = "/exam";
}

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.splashRoute,
    routes: [],
  );
}