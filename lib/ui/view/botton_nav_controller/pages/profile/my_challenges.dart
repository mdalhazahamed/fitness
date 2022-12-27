import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fitness/ui/route/route.dart';
import 'package:fitness/ui/style/style.dart';
import 'package:fitness/ui/view/botton_nav_controller/details/video_details_page.dart';

import 'package:fitness/ui/view/botton_nav_controller/pages/see_all_product.dart';
import 'package:fitness/ui/view/widgets/nav_home-categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../style/style_screen.dart';

class MyChallenges extends StatefulWidget {
  const MyChallenges({super.key});

  @override
  State<MyChallenges> createState() => _MyChallengesState();
}

class _MyChallengesState extends State<MyChallenges> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //tabs

          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: navHomeCategories(
              "Meal",
              () => Get.toNamed(seeAllProduct,
                  arguments: SeeAllProduct('profile_meal')),
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            height: 140.h,
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('all_products')
                  .orderBy('profile_meal', descending: true)
                  .snapshots(),
              builder: (_, snapshot) {
                if (snapshot.hasError) return Text('Error = ${snapshot.error}');

                if (snapshot.hasData) {
                  final docs = snapshot.data!.docs;
                  return Container(
                    height: 140.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: docs.length,
                        itemBuilder: (_, i) {
                          final data = docs[i].data();
                          return Padding(
                            padding: EdgeInsets.only(left: 16.w),
                            child: InkWell(
                              onTap: () {
                                Get.to(VideoDetailsPage(data));
                              },
                              child: Container(
                                width: 280.w,
                                height: 140.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.r),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(data["img"]),
                                  ),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 20.w, left: 16.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(data['title'],
                                          style: style18(Colors.white)),
                                      SizedBox(height: 10.h),
                                      Text(
                                        data['subtitle'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(height: 2.h),
                                      Row(
                                        children: [
                                          Text(
                                            data['time'],
                                            style: AppStyles
                                                .videoSubTitleTextStyle,
                                          ),
                                          SizedBox(width: 4.w),
                                          Text("min", style: style14),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                }

                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          SizedBox(height: 20.h),
          navHomeCategories(
            "Execrise",
            () => Get.toNamed(seeAllProduct,
                arguments: SeeAllProduct('profile_exercise')),
          ),
          SizedBox(height: 16.h),

          Container(
            height: 170.h,
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('all_products')
                  .orderBy('profile_exercise', descending: true)
                  .snapshots(),
              builder: (_, snapshot) {
                if (snapshot.hasError) return Text('Error = ${snapshot.error}');

                if (snapshot.hasData) {
                  final docs = snapshot.data!.docs;
                  return Container(
                    height: 180.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: docs.length,
                        itemBuilder: (_, i) {
                          final data = docs[i].data();
                          return Padding(
                            padding: EdgeInsets.only(left: 16.w),
                            child: InkWell(
                              onTap: () {
                                Get.to(VideoDetailsPage(data));
                              },
                              child: Container(
                                width: 280.w,
                                height: 170.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.r),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(data["img"]),
                                  ),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 20.w, left: 16.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data['title'],
                                        style: style18(Colors.white),
                                      ),
                                      SizedBox(height: 5.h),
                                      Row(
                                        children: [
                                          Text(
                                            data['time'],
                                            style: AppStyles
                                                .videoSubTitleTextStyle,
                                          ),
                                          SizedBox(width: 4.w),
                                          Text("min", style: style14),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                }

                return Center(child: CircularProgressIndicator());
              },
            ),
          ),

          SizedBox(height: 16.h),
          navHomeCategories(
            "Quiz",
            () => Get.toNamed(seeAllProduct,
                arguments: SeeAllProduct('profile_quiz')),
          ),

          SizedBox(height: 16.h),
          Container(
            height: 140.h,
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('all_products')
                  .orderBy('profile_quiz', descending: true)
                  .snapshots(),
              builder: (_, snapshot) {
                if (snapshot.hasError) return Text('Error = ${snapshot.error}');

                if (snapshot.hasData) {
                  final docs = snapshot.data!.docs;
                  return Container(
                    height: 170.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: docs.length,
                        itemBuilder: (_, i) {
                          final data = docs[i].data();
                          return Padding(
                            padding: EdgeInsets.only(left: 16.w),
                            child: InkWell(
                              onTap: () {
                                Get.to(VideoDetailsPage(data));
                              },
                              child: Container(
                                width: 280.w,
                                height: 140.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.r),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(data["img"]),
                                  ),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 20.w, left: 16.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data['title'],
                                        style: style18(Colors.white),
                                      ),
                                      SizedBox(height: 1.h),
                                      Text(
                                        data['subtitle'],
                                        style: style18(Colors.white),
                                      ),
                                      SizedBox(height: 5.h),
                                      Row(
                                        children: [
                                          Text(data['time'], style: style14),
                                          SizedBox(width: 4.w),
                                          Text("min", style: style14),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                }

                return Center(child: CircularProgressIndicator());
              },
            ),
          ),

          SizedBox(height: 15.h),
        ],
      ),
    );
  }
}
