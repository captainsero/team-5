import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team_5_examapp/config/di/di.dart';
import 'package:team_5_examapp/core/routing/routes_manager.dart';
import 'package:team_5_examapp/core/themes/light_theme.dart';
import 'package:team_5_examapp/features/auth/login_screen/presentations/screens/loginScreen.dart';
import 'package:team_5_examapp/features/auth/login_screen/presentations/view_model/cubit/login_cubit.dart';
import 'package:team_5_examapp/generated/l10n.dart';


void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Exam App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,

          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,

          initialRoute: Routes.loginRoute,

          routes: {
            Routes.loginRoute: (context) {
              return BlocProvider(
                create: (context) => getIt<LoginViewModel>(),
                child: const LoginScreen(),
              );
            },
          },
        );
      },
    );
  }
}