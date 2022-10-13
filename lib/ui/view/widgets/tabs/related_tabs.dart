import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RelatedTabs extends StatelessWidget {
  const RelatedTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 79.w,
          width: 79,
          color: Colors.red,
        ),
      ],
    );
  }
}
