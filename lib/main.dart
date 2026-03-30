import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:team_5_examapp/config/di/di.dart';
import 'package:team_5_examapp/features/questions/data/models/answer_dto.dart';
import 'package:team_5_examapp/features/questions/data/models/check_answer_dto.dart';
import 'core/routing/routes_manager.dart';
import 'core/themes/light_theme.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Avoid 0× screen scale before layout; otherwise `.sp` font sizes become 0 and StrutStyle asserts.
  await ScreenUtil.ensureScreenSize();
  configureDependencies();
  final dir = await getApplicationDocumentsDirectory();

  Hive.init(dir.path);
  Hive.registerAdapter(AnswerDtoAdapter());
  Hive.registerAdapter(CheckAnswerDtoAdapter());

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
        return MaterialApp.router(
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
        );
      },
    );
  }
}
