import 'dart:async';

import 'package:fitness/ui/const/colors.dart';
import 'package:fitness/ui/view/auth/login_screen.dart';
import 'package:fitness/ui/view/auth/on_boarding_screen.dart';
import 'package:fitness/ui/view/botton_nav_controller/nav_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 4),
      () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (_) => OnbordingScreen(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.network(
                  'https://assets3.lottiefiles.com/packages/lf20_McIaL4.json',
                  width: 250.w),
            ],
          ),
        ),
      ),
    );
  }
}
