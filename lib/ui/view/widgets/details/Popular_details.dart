import 'package:fitness/ui/const/colors.dart';
import 'package:fitness/ui/route/route.dart';
import 'package:fitness/ui/style/style.dart';
import 'package:fitness/ui/view/widgets/details/see_all_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PopularDetails extends StatelessWidget {
  const PopularDetails({super.key});

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
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 3.h, left: 22.w),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 20.sp,
                                        color: Color(0xFFF0BE3D),
                                      ),
                                      SizedBox(width: 5.w),
                                      Text("4.9", style: style16(Colors.white))
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  "Steak",
                                  style: style18,
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
              "More Meals",
              style: style22,
            ),
          ),
          Column(
            children: [
              for (int i = 1; i < 10; i++)
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
                                style,
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              Text(
                                "Senior Treiner",
                                style: style14(Colors.white),
                              ),
                              SizedBox(width: 6.w),
                              Icon(
                                Icons.circle,
                                size: 6.sp,
                                color: Colors.white,
                              ),
                              SizedBox(width: 6.w),
                              Text(
                                "8 Trainings",
                                style: style14(Colors.grey),
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
