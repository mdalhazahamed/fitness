import 'package:fitness/ui/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewsTabs extends StatelessWidget {
  const ReviewsTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Container(
                height: 79.h,
                width: 79.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://www.lifefitness.com/resource/image/1577926/portrait_ratio1x1/600/600/108d55725fc7dd0385f7176be6f523b2/aS/run-cx-treadmill-life-fitness-man-running-stride-edited-final-2000x1300.jpg"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.w),
                child: Text(
                  "USers 01",
                  style: style18(Colors.white),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Color(0XFFF0BE3D),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
