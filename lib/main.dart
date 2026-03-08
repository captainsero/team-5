import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team_5_examapp/config/di/di.dart';
import 'package:team_5_examapp/features/auth/forget_password/data/data_sources/forget_pass_remote_data_source_contract.dart';
import 'core/routing/routes_manager.dart';
import 'core/themes/light_theme.dart';
import 'features/auth/loginScreen/presentations/loginScreen.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  final response = getIt.get<ForgetPassRemoteDataSourceContract>();
  response.forgetPassword(email: "yasoo976098@gmail.com");
  response.confirmValidationCode(resetCode: "717142");

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
          routes: {Routes.loginRoute: (context) => const LoginScreen()},
        );
      },
    );
  }
}
