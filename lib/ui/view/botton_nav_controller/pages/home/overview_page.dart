import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fitness/ui/route/route.dart';
import 'package:fitness/ui/view/botton_nav_controller/details/video_details_page.dart';

import 'package:fitness/ui/view/botton_nav_controller/pages/home/see_all_product.dart';
import 'package:fitness/ui/view/widgets/nav_home-categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../style/style.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  //collectionName
  final CollectionReference _refference =
      FirebaseFirestore.instance.collection('all_products');

  //queryName
  late Future<QuerySnapshot> _futureDataNewestPodcast;
  late Future<QuerySnapshot> _futureDataRecommededVideos;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //tabs
          Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: navHomeCategories(
              "Newest Podcast",
              () => Get.toNamed(seeAllProduct,
                  arguments: SeeAllProduct('newest_podcast')),
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            height: 140.h,
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('all_products')
                  .where('newest_podcast', isEqualTo: true)
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
                            padding: EdgeInsets.only(right: 10.w),
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
                                      Text(
                                        data['subtitle'],
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            data['name'],
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          SizedBox(width: 10),
                                          Text("-"),
                                          SizedBox(width: 10),
                                          Text(
                                            data['date'],
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
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
            "Recommended Videos",
            () => Get.toNamed(seeAllProduct,
                arguments: SeeAllProduct('recommended_videos')),
          ),
          SizedBox(height: 16.h),
          Container(
            height: 170.h,
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('all_products')
                  .where('recommended_videos', isEqualTo: true)
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
                            padding: EdgeInsets.only(right: 10.w),
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
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        data['date'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp),
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
        ],
      ),
    );
  }
}

