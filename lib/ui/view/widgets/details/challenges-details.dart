import 'package:fitness/ui/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChallengesDetails extends StatelessWidget {
  const ChallengesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //tabs
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Meal",
                    style: TextStyle(color: Colors.white, fontSize: 22.sp)),
                InkWell(
                  onTap: () {},
                  child: Text("see all",
                      style: TextStyle(
                          color: AppColors.backgroudColor, fontSize: 16.sp)),
                ),
              ],
            ),
          ),
          SizedBox(height: 14.h),
          //meal see ll
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Row(
                children: [
                  for (int i = 1; i < 10; i++)
                    Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: Container(
                        width: 280.w,
                        height: 140.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/alhaz2.jpeg"),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20.w, left: 16.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Staying fit during",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "winter time",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Alexa Angel - 5 min listen",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          SizedBox(height: 22.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Excise",
                    style: TextStyle(color: Colors.white, fontSize: 22.sp)),
                InkWell(
                  onTap: () {},
                  child: Text("see all",
                      style: TextStyle(
                          color: AppColors.backgroudColor, fontSize: 16.sp)),
                ),
              ],
            ),
          ),

          //exercise sell

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Row(
                children: [
                  for (int i = 1; i < 10; i++)
                    Padding(
                      padding: EdgeInsets.only(right: 8.w, top: 12.h),
                      child: Container(
                        width: 250.w,
                        height: 170.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/alhaz1.jpg"),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20.w, left: 16.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Staying fit during",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "2 min",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          SizedBox(height: 22.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Quiz",
                    style: TextStyle(color: Colors.white, fontSize: 22.sp)),
                InkWell(
                  onTap: () {},
                  child: Text("see all",
                      style: TextStyle(
                          color: AppColors.backgroudColor, fontSize: 16.sp)),
                ),
              ],
            ),
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Row(
                children: [
                  for (int i = 1; i < 10; i++)
                    Padding(
                      padding: EdgeInsets.only(right: 8.w, top: 10.h),
                      child: Container(
                        width: 280.w,
                        height: 140.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/alhaz2.jpeg"),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20.w, left: 16.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Staying fit during",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "winter time",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
