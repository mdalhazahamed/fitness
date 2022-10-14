import 'package:fitness/ui/const/colors.dart';
import 'package:fitness/ui/route/route.dart';
import 'package:fitness/ui/style/style.dart';
import 'package:fitness/ui/view/widgets/details/see_all_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PopularDetails2 extends StatelessWidget {
  const PopularDetails2({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //tabs
          Padding(
            padding: EdgeInsets.only(right: 18.w, left: 18.w, top: 22.h),
            child: Text("Most Popular Meals", style: style22),
          ),

          //meal see ll
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, top: 16.h),
              child: Row(
                children: [
                  for (int i = 1; i < 10; i++)
                    InkWell(
                      onTap: () {
                        Get.toNamed(favouriteDetails);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(favouriteDetails);
                          },
                          child: Container(
                            width: 120.w,
                            height: 200.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: Color(0xFF202835),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 5.h),
                                  child: Container(
                                    height: 110.h,
                                    width: 110.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.r),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "https://images.ctfassets.net/3s5io6mnxfqz/4fw6zpVAdJTiggWYQMOWYf/d0d10fd16a9d0100b90d1b43e37f58a2/AdobeStock_214673241.jpeg"),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 3.h),
                                Text(
                                  "Antonio",
                                  style: style18,
                                ),
                                Text(
                                  "Guvan",
                                  style: style18,
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  "Senior Trainer",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                )
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
            padding: EdgeInsets.only(top: 24.h, left: 18.w),
            child: Text(
              "All Results",
              style: style22,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.w, top: 16),
                child: Row(
                  children: [
                    Container(
                      height: 60.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://manofmany.com/wp-content/uploads/2021/01/Fitness-Trends-2021-c.jpg"),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.sp),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Andrew Suva",
                          style:
                              TextStyle(fontSize: 20.sp, color: Colors.white),
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Text(
                              "Senior Treiner",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Icon(
                              Icons.circle,
                              size: 8.sp,
                              color: Colors.white,
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              "8 Trainings",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
