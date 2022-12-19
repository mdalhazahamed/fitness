import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/ui/route/route.dart';
import 'package:fitness/ui/view/botton_nav_controller/details/favourite_details.dart';
import 'package:fitness/ui/view/widgets/nav_home_callenges.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../style/style.dart';

class ExecrisePage extends StatefulWidget {
  const ExecrisePage({super.key});

  @override
  State<ExecrisePage> createState() => _ExecrisePageState();
}

class _ExecrisePageState extends State<ExecrisePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          navHomeCallenges(
            "Best Exercise Results",
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            height: 200.h,
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('challenges')
                  .where('exercise', isEqualTo: true)
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
                                  Column(
                                    children: [
                                      SizedBox(height: 2.w),
                                      Text(data['name'],
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Colors.white)),
                                      Text(data['nickname'],
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Colors.white)),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    data['position'],
                                    style: TextStyle(
                                        fontSize: 12.sp, color: Colors.white),
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
          SizedBox(height: 10.h),
          navHomeCallenges(
            "All Results",
          ),
          SizedBox(height: 15.h),
          Container(
            height: 300.h,
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('challenges')
                  .where('exercise_result', isEqualTo: true)
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
                          padding: EdgeInsets.only(left: 16.w, top: 16),
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
                                    style: style18(Colors.white),
                                  ),
                                  SizedBox(height: 4.h),
                                  Row(
                                    children: [
                                      Text(
                                        data['position'],
                                        style: style14,
                                      ),
                                      SizedBox(width: 6.w),
                                      Icon(
                                        Icons.circle,
                                        size: 6.sp,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 6.w),
                                      Row(
                                        children: [
                                          Text(
                                            data['total'],
                                            style: style14,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            "Trainer",
                                            style: style14,
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
