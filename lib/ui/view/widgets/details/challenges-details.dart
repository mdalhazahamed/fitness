import 'package:fitness/ui/const/colors.dart';
import 'package:fitness/ui/route/route.dart';
import 'package:fitness/ui/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChallengesDetails extends StatelessWidget {
  const ChallengesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //tabs
          Padding(
            padding: EdgeInsets.only(right: 18.w, left: 18.w, top: 22.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Newest Podcast", style: style22),
                InkWell(
                  onTap: () {
                    Get.toNamed(seeAllProduct);
                  },
                  child: Text("see all",
                      style: TextStyle(
                          color: AppColors.backgroudColor, fontSize: 16.sp)),
                ),
              ],
            ),
          ),

          //meal see ll
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, top: 16.h),
              child: Row(
                children: [
                  for (int i = 1; i < 10; i++)
                    Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(favouriteDetails);
                        },
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
                    ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(right: 18.w, left: 18.w, top: 24.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Recommended Videos", style: style22),
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
                      padding: EdgeInsets.only(left: 16.w, top: 16.h),
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
        ],
      ),
    );
  }
}
