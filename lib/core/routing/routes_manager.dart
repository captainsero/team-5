import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:team_5_examapp/config/di/di.dart';
import 'package:team_5_examapp/core/routing/routes_path.dart';
import 'package:team_5_examapp/features/auth/forget_password/presentation/screens/forget_pass_view.dart';
import 'package:team_5_examapp/features/auth/forget_password/presentation/screens/reset_pass_view.dart';
import 'package:team_5_examapp/features/auth/forget_password/presentation/screens/otp_verification_view.dart';
import 'package:team_5_examapp/features/auth/forget_password/presentation/view_model/cubit/forget_pass_view_model.dart';
import 'package:team_5_examapp/features/auth/login/presentations/screens/login_screen.dart';
import 'package:team_5_examapp/features/auth/register/presentation/screens/register_screen.dart';
import 'package:team_5_examapp/features/profile/presentation/screens/profile_view.dart';
import 'package:team_5_examapp/features/profile/presentation/view_model/profile_view_model.dart';

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
        builder: (_, _) {
          final ForgetPassViewModel forgetPassViewModel = getIt
              .get<ForgetPassViewModel>();
          return BlocProvider<ForgetPassViewModel>(
            create: (context) => forgetPassViewModel,
            child: ForgetPassView(forgetPassViewModel: forgetPassViewModel),
          );
        },
      ),
      GoRoute(
        path: RoutesPath.otpVerificationRoute,
        name: RoutesPath.otpVerificationRoute,
        builder: (_, state) {
          final ForgetPassViewModel forgetPassViewModel =
              state.extra as ForgetPassViewModel;
          return BlocProvider<ForgetPassViewModel>.value(
            value: forgetPassViewModel,
            child: OtpVerificationView(
              forgetPassViewModel: forgetPassViewModel,
            ),
          );
        },
      ),
      GoRoute(
        path: RoutesPath.resetPassRoute,
        name: RoutesPath.resetPassRoute,
        builder: (_, state) {
          final ForgetPassViewModel forgetPassViewModel =
              state.extra as ForgetPassViewModel;
          return BlocProvider<ForgetPassViewModel>.value(
            value: forgetPassViewModel,
            child: ResetPassView(forgetPassViewModel: forgetPassViewModel),
          );
        },
      ),
      GoRoute(
        path: RoutesPath.profileRoute,
        name: RoutesPath.profileRoute,
        builder: (_, state) {
          final profileViewModel = getIt.get<ProfileViewModel>();

          // 2. Wrap it here so the entire ProfileView has access to the context
          return BlocProvider<ProfileViewModel>(
            create: (context) => profileViewModel,
            child: ProfileView(viewModel: profileViewModel),
          );
        },
      ),
    ],
  );
}
