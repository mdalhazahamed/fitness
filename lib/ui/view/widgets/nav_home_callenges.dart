
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style/style_screen.dart';

Widget navHomeCallenges(String categoryName) {
  return Padding(
    padding: EdgeInsets.only(left: 15.w, right: 15.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          categoryName,
          style:  AppStyles.bigTextStyle,
        ),
      ],
    ),
  );
}
