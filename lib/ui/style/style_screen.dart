import 'package:fitness/ui/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static InputDecoration textFieldDecoration(String hint) => InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        hintText: hint,
      );

  static TextStyle tabTextStyle = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w300,
  );

  static TextStyle bigTextStyle = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w200,
  );

  static TextStyle seeAllTextStyle = TextStyle(
    fontSize: 14.sp,
    color: AppColors.backgroudColor,
    fontWeight: FontWeight.w300,
  );

  static TextStyle videoTitleTextStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w300,
    color: Colors.white,
  );

  static TextStyle videoSubTitleTextStyle = TextStyle(
    fontSize: 14.sp,
    color: Colors.grey[300],
    fontWeight: FontWeight.w300,
  );
  static TextStyle blogTitleTextStyle = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w300,
    color: Colors.white,
  );

  static TextStyle blogSubTitleTextStyle = TextStyle(
    fontSize: 16.sp,
    color: Colors.grey[300],
    fontWeight: FontWeight.w300,
  );

  progressDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Image.asset(
            "assets/files/loading.gif",
            height: 150.h,
          ),
        );
      },
      barrierDismissible: false,
    );
  }
}
