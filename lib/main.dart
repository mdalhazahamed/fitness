import 'package:firebase_core/firebase_core.dart';
import 'package:fitness/ui/route/route.dart';
import 'package:fitness/ui/theme/app_theme.dart';
import 'package:fitness/ui/view/botton_nav_controller/nav_controller.dart';
import 'package:fitness/ui/view/botton_nav_controller/pages/my_profile_page.dart';
import 'package:fitness/ui/view/botton_nav_controller/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
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
            themeMode: ThemeMode.light,
            initialRoute: splash,
            getPages: getPages,
            home: SplashScreen(),
          );
        });
  }
}
