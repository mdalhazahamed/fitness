import 'package:fitness/ui/route/route.dart';
import 'package:fitness/ui/theme/app_theme.dart';
import 'package:fitness/ui/view/auth/forget_screen.dart';
import 'package:fitness/ui/view/auth/login_screen.dart';
import 'package:fitness/ui/view/auth/on_boarding_screen.dart';
import 'package:fitness/ui/view/auth/registration_screen.dart';
import 'package:fitness/ui/view/botton_nav_controller/nav_controller.dart';
import 'package:fitness/ui/view/botton_nav_controller/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(411, 823),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Fitness Apps',
            theme: AppTheme().lightTheme(context),
            darkTheme: AppTheme().darkTheme(context),
            themeMode: ThemeMode.system,
            initialRoute: splash,
             getPages: getPages,
            home: SplashScreen(),
          );
        });
  }
}
