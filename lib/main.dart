import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waheed/core/components/app_colors.dart';
import 'package:waheed/views/auth/welcom/login/view.dart';
import 'package:waheed/views/auth/welcom/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Waheed Hassan',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ar', 'EG'),
            Locale('en', 'US'),
          ],
          locale: const Locale('ar', 'EG'),
          themeMode: ThemeMode.system,
          theme: ThemeData(
            fontFamily: 'IBMPlexSansArabic',
            brightness: Brightness.light,
            scaffoldBackgroundColor: AppColors.background,
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.background,
              elevation: 0,
              centerTitle: true,
              iconTheme: IconThemeData(color: AppColors.primary),
            ),
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primary,
              primary: AppColors.primary,
              brightness: Brightness.light,
            ),
          ),
          darkTheme: ThemeData(
            fontFamily: 'IBMPlexSansArabic',
            brightness: Brightness.dark,
            scaffoldBackgroundColor: AppColors.primary,
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.primary,
              elevation: 0,
              centerTitle: true,
              iconTheme: IconThemeData(color: AppColors.background),
            ),
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.background,
              primary: AppColors.background,
              brightness: Brightness.dark,
            ),
          ),
          home: const LoginView(), 
        );
      },
    );
  }
}