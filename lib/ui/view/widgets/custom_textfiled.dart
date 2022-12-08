import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../const/colors.dart';

Widget myTextfield(
  keyboardtype,
  controller,
  hinttext,
  validator, {
  bool obscureText = false,
  // suffixIcon,
  // prefixWidget,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10.h),
    child: TextFormField(
      keyboardType: keyboardtype,
      style: TextStyle(),
      controller: controller,
      // obscureText: obscureText,
      textInputAction: TextInputAction.next,
      validator: validator,
      maxLines: 1,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 15.w),
        // suffixIcon: suffixIcon,
        // prefix: prefixWidget,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.backgroudColor),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple),
          borderRadius: BorderRadius.circular(10.r),
        ),
        hintText: hinttext,
        hintStyle: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
        errorStyle: TextStyle(
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}
