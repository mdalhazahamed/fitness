import 'package:fitness/ui/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget navHomeCategories(String categoryName, onClick) {
  return Padding(
    padding: EdgeInsets.only(left: 15.w, right: 15.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          categoryName,
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        InkWell(
          onTap: onClick,
          child: Text(
            "See All",
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.backgroudColor),
          ),
        ),
      ],
    ),
  );
}
