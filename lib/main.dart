import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team_5_examapp/config/di/di.dart';
import 'core/routing/routes_manager.dart';
import 'core/themes/light_theme.dart';
import 'features/exams/presentation/screens/exams_screen.dart';
import 'features/exams/presentation/widgets/start_exam_widget.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
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
      ensureScreenSize: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Exam App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,

          // ✅ Localization
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          routes: {
            Routes.getExamsRoute: (context) => const ExamsScreen(
              subjectId: '',
              token:
                  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5YzUzMTVmY2ViMmM1OWY4NGE0MDMwNSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzc0NzE5NTE1fQ.2gWE4g8hyskx87H2wwgoy1W6USpNz_NBbdKv4a7pYFo',
            ),
          },
          initialRoute: Routes.getExamsRoute,        );
      },
    );
  }
}
