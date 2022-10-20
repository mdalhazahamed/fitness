import 'package:fitness/ui/const/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle style14(color) => TextStyle(color: color, fontSize: 14.sp);
TextStyle style15 = TextStyle(color: AppColors.greyColor, fontSize: 14.5.sp);
TextStyle style16(color) =>
    TextStyle(color: color, fontSize: 14.sp, fontWeight: FontWeight.bold);
TextStyle style17 = TextStyle(color: AppColors.whiteColor, fontSize: 17.sp);
TextStyle style18 = TextStyle(
    fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.w500);
TextStyle style22 = TextStyle(color: Colors.white, fontSize: 20.sp);
TextStyle style24(fontWeight) =>
    TextStyle(fontWeight: fontWeight, fontSize: 24.sp);
TextStyle style = TextStyle(color: Colors.white, fontSize: 18.sp);

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

InputDecoration myDecoration(hint,icon) => InputDecoration(
   contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: hint,
                      border: InputBorder.none,
                      fillColor: Colors.grey[600]?.withOpacity(0.5),
                      filled: true,
                      hintStyle: TextStyle(
                        fontSize: 15.sp,
                      ),
                      prefixIcon:icon,
                      prefixStyle: TextStyle(fontSize: 15.sp),
);
