import 'package:fitness/ui/style/style.dart';
import 'package:fitness/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  RxBool darkMode = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Good Morning,", style: style24(FontWeight.w500)),
              Text("Starla", style: style24(FontWeight.w600)),
              Container(
                height: 40.h,
                width: double.infinity,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
