import 'package:firebase_core/firebase_core.dart';
import 'package:fitness/ui/route/route.dart';
import 'package:fitness/ui/theme/app_theme.dart';
import 'package:fitness/ui/view/auth/login_screen.dart';

import 'package:fitness/ui/view/botton_nav_controller/nav_controller.dart';
import 'package:fitness/ui/view/botton_nav_controller/pages/challanges_page.dart';
import 'package:fitness/ui/view/botton_nav_controller/pages/home_page.dart';

import 'package:fitness/ui/view/botton_nav_controller/pages/media_page.dart';
import 'package:fitness/ui/view/botton_nav_controller/pages/my_profile_page.dart';
import 'package:fitness/ui/view/botton_nav_controller/pages/search_page.dart';
import 'package:fitness/ui/view/botton_nav_controller/splash_screen.dart';
import 'package:fitness/ui/view/widgets/details/Popular_details.dart';
import 'package:fitness/ui/view/widgets/details/challenges-details.dart';
import 'package:fitness/ui/view/widgets/details/favourite_details.dart';
import 'package:fitness/ui/view/widgets/details/see_all_details.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

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
            themeMode: ThemeMode.system,
            initialRoute: splash,
            getPages: getPages,
            home: SplashScreen(),
          );
        });
  }
}
