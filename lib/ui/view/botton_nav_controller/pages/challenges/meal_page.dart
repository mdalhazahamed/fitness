import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/ui/route/route.dart';
import 'package:fitness/ui/view/widgets/nav_home_callenges.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../style/style.dart';
import '../../details/favourite_details.dart';

class MealPage extends StatefulWidget {
  const MealPage({super.key});

  @override
  State<MealPage> createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          navHomeCallenges(
            "Most Popular Meals",
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            height: 200.h,
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('challenges')
                  .where('most_popular_meal', isEqualTo: true)
                  .snapshots(),
              builder: (_, snapshot) {
                if (snapshot.hasError) return Text('Error = ${snapshot.error}');

                if (snapshot.hasData) {
                  final docs = snapshot.data!.docs;
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: docs.length,
                      itemBuilder: (_, i) {
                        final data = docs[i].data();
                        return Padding(
                          padding: EdgeInsets.only(right: 12.w),
                          child: InkWell(
                            onTap: () => Get.toNamed(favouriteDetails,
                                arguments: FavouriteDetails(data)),
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
                                        borderRadius:
                                            BorderRadius.circular(6.r),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            data['img'][0],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 10.h, left: 32.w),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 20.sp,
                                          color: Color(0xFFF0BE3D),
                                        ),
                                        SizedBox(width: 5.w),
                                        Text(data['rating'],
                                            style: style18(Colors.white))
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 15.h),
                                  Text(
                                    data['food'],
                                    style: style14,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                }

                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          SizedBox(height: 15.h),
          navHomeCallenges(
            "More Meals",
          ),
          Container(
            height: 400.h,
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('challenges')
                  .where('more_meal', isEqualTo: true)
                  .snapshots(),
              builder: (_, snapshot) {
                if (snapshot.hasError) return Text('Error = ${snapshot.error}');

                if (snapshot.hasData) {
                  final docs = snapshot.data!.docs;
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: docs.length,
                      itemBuilder: (_, i) {
                        final data = docs[i].data();
                        return Padding(
                          padding: EdgeInsets.only(left: 16.w, top: 10.h),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () => Get.toNamed(favouriteDetails,
                                    arguments: FavouriteDetails(data)),
                                child: Container(
                                  height: 60.h,
                                  width: 60.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.r),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(data['img'][0]),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 16.sp),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data['name'],
                                    style: TextStyle(fontSize: 18.sp),
                                  ),
                                  SizedBox(height: 4.h),
                                  Row(
                                    children: [
                                      Text(
                                        data['position'],
                                        style: TextStyle(fontSize: 14.sp),
                                      ),
                                      SizedBox(width: 6.w),
                                      Icon(
                                        Icons.circle,
                                        size: 6.sp,
                                      ),
                                      SizedBox(width: 6.w),
                                      Row(
                                        children: [
                                          Text(
                                            data['total'],
                                            style: TextStyle(fontSize: 14.sp),
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            "Trainer",
                                            style: TextStyle(fontSize: 14.sp),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      });
                }

                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
