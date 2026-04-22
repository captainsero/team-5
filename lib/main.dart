import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team_5_examapp/config/di/di.dart';
import 'package:team_5_examapp/features/subjects_portal/presentation/view_model/cubit/explore_cubit.dart';
import 'package:team_5_examapp/config/hive_service/hive_service.dart';
import 'core/routing/routes_manager.dart';
import 'core/themes/light_theme.dart';

import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await configureDependencies();

  final dir = getIt<Directory>();
  await HiveService.init(dir);

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
      ensureScreenSize: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<ExploreCubit>(
              create: (_) => getIt.get<ExploreCubit>()..getAllSubjects(),
            ),
          ],
          child: MaterialApp.router(
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

            routerConfig: AppRouter.router,
          ),
        );
      },
    );
  }
}
