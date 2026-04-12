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
import 'package:team_5_examapp/features/questions/presentation/screens/questions_screen.dart';
import 'package:team_5_examapp/features/questions/presentation/screens/score_screen.dart';

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
        path: Routes.questionsRoute,
        name: Routes.questionsRoute,
        builder: (context, state) {
          return QuestionsScreen(examId: state.extra.toString());
        },
      ),
      GoRoute(
        path: Routes.scoreRoute,
        name: Routes.scoreRoute,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          final int time = extra['time'];
          final String examId = extra['examId'];

          return ScoreScreen(time: time, examId: examId);
        },
      ),
    ],
  );
}
