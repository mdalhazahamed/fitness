import 'package:fitness/ui/route/route.dart';
import 'package:fitness/ui/theme/app_theme.dart';

import 'package:fitness/ui/view/botton_nav_controller/pages/media_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

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
            home: MediaPage(),
          );
        });
  }
}
