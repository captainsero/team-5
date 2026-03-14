import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/routes_manager.dart';
import 'core/themes/light_theme.dart';
import 'features/auth/login_screen/api/auth_api_client/auth_api_client.dart';
import 'features/auth/login_screen/api/data_sources/auth_remote_data_source_impl.dart';
import 'features/auth/login_screen/data/repo/auth_repo_impl.dart';
import 'features/auth/login_screen/domain/use_cases/login_use_cases.dart';
import 'features/auth/login_screen/presentations/screens/loginScreen.dart';
import 'features/auth/login_screen/presentations/view_model/cubit/login_cubit.dart';
import 'generated/l10n.dart';

void main() {
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

              final apiClient = AuthApiClient();
              final remoteDataSource = AuthRemoteDataSourceImpl(apiClient);
              final repo = AuthRepoImpl(remoteDataSource: remoteDataSource);
              final loginUseCase = LoginUseCase(repo: repo);

              return BlocProvider(
                create: (context) => LoginViewModel(loginUseCase: loginUseCase),
                child: const LoginScreen(),
              );
            },
          },
        );
      },
    );
  }
}