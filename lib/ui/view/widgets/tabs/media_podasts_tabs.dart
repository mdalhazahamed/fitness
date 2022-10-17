import 'package:fitness/ui/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MediaPodcasts extends StatelessWidget {
  const MediaPodcasts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 36.h),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        childAspectRatio: 0.71.w,
        children: [
          for (int i = 0; i < 4; i++)
            InkWell(
              onTap: () {
                Get.toNamed(videosDetails);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://www.petebennettphotography.com/wp/wp-content/uploads/2018/08/Dean-Dark-8.jpg"),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 48.h, left: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Congdition",
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Text("Edward Mike",
                          style:
                              TextStyle(fontSize: 16.sp, color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
