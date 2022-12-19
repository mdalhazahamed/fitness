import 'package:fitness/ui/const/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle style24 = TextStyle(color: Colors.white, fontSize: 24.sp);
TextStyle style22 = TextStyle(color: Colors.white, fontSize: 22.sp);
TextStyle style18(color) => TextStyle(color: color, fontSize: 18.sp);
TextStyle style20 = TextStyle(
    color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.w500);
TextStyle style14 = TextStyle(color: Colors.white70, fontSize: 14.sp);

InputDecoration textFieldDecorcation(String hin, Icon icon,
        {required IconButton suffixIcon}) =>
    InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      hintText: hin,
      hintStyle: TextStyle(
        fontSize: 15.sp,
      ),
      prefixIcon: icon,
      prefixStyle: TextStyle(fontSize: 15.sp),
    );

InputDecoration myDecoration(hint, icon) => InputDecoration(
      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      hintText: hint,
      border: InputBorder.none,
      fillColor: Colors.grey[600]?.withOpacity(0.7),
      filled: true,
      hintStyle: TextStyle(
        fontSize: 15.sp,
      ),
      prefixIcon: icon,
      prefixStyle: TextStyle(fontSize: 15.sp),
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

 InputDecoration textFieldDecoration(String hint) => InputDecoration(
    border: OutlineInputBorder(
      borderRadius:BorderRadius.circular(10.r),
    ),
    hintText: hint,

  );
