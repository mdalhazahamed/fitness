import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../style/style.dart';
import '../details/video_details_page.dart';

class ItemsView extends StatefulWidget {
  const ItemsView({super.key});

  @override
  State<ItemsView> createState() => _ItemsViewState();
}

class _ItemsViewState extends State<ItemsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF090D22),
      appBar: AppBar(
        backgroundColor: Color(0XFF090D22),
        centerTitle: true,
        title: Text("View Item", style: style20),
        elevation: 2,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_circle_left_outlined, color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 16.h),
            child: Text("latest items", style: style20),
          ),
          SizedBox(height: 15.h),
          Container(
            height: 200.h,
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('all_products')
                  .orderBy('newest_podcast', descending: true)
                  .snapshots(),
              builder: (_, snapshot) {
                if (snapshot.hasError) return Text('Error = ${snapshot.error}');

                if (snapshot.hasData) {
                  final docs = snapshot.data!.docs;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (_, i) {
                      final data = docs[i].data();
                      return Padding(
                        padding: EdgeInsets.only(right: 12.w),
                        child: InkWell(
                          onTap: () {
                            Get.to(VideoDetailsPage(data));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 16.w),
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
                                            data["img"],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(height: 2.w),
                                      Text(data["name"],
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Colors.white)),
                                      Text(data["title"],
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Colors.white)),
                                    ],
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    data["position"],
                                    style: TextStyle(
                                        fontSize: 12.sp, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }

                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 16.h, bottom: 3.h),
            child: Text("latest items", style: style20),
          ),
          Container(
            height: 400.h,
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('all_products')
                  .orderBy('newest_podcast', descending: true)
                  .snapshots(),
              builder: (_, snapshot) {
                if (snapshot.hasError) return Text('Error = ${snapshot.error}');

                if (snapshot.hasData) {
                  final docs = snapshot.data!.docs;
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 4,
                    itemBuilder: (_, i) {
                      final data = docs[i].data();
                      return Padding(
                        padding: EdgeInsets.only(left: 16.w, top: 12.h),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(VideoDetailsPage(data));
                              },
                              child: Container(
                                height: 60.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.r),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      data['img'],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 16.h),
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
                                          data['like'],
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
                            ),
                          ],
                        ),
                      );
                    },
                  );
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
