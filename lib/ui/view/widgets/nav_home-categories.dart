import 'package:fitness/ui/style/style_screen.dart';
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
          style: AppStyles.bigTextStyle,
        ),
        InkWell(
          onTap: onClick,
          child: Text(
            "See All",
            style: AppStyles.seeAllTextStyle,
          ),
        ),
      ],
    ),
  );
}
