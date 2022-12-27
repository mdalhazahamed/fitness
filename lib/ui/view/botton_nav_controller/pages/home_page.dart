import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/ui/const/colors.dart';
import 'package:fitness/ui/route/route.dart';
import 'package:fitness/ui/style/style.dart';
import 'package:fitness/ui/style/style_screen.dart';
import 'package:fitness/ui/view/auth/login_screen.dart';
import 'package:fitness/ui/view/botton_nav_controller/details/blog_details_page.dart';

import 'package:fitness/ui/view/botton_nav_controller/details/reviews_tabs.dart';
import 'package:fitness/ui/view/botton_nav_controller/pages/view_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/back_dialog_box.dart';
import '../../widgets/nav_home-categories.dart';
import '../details/video_details_page.dart';

import 'see_all_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackButtonPressed(context),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Dashboard",
            style: AppStyles.bigTextStyle,
          ),
          automaticallyImplyLeading: false,
          toolbarHeight: 55.h,
          elevation: 2,
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(favourte);
              },
              icon: Icon(Icons.favorite, color: Colors.red),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.h, bottom: 16.h, left: 10.w),
                  child: navHomeCategories(
                    "Newest Podcast",
                    () => Get.toNamed(seeAllProduct,
                        arguments: SeeAllProduct('newest_podcast')),
                  ),
                ),
                Container(
                  height: 140.h,
                  child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection('all_products')
                        .orderBy('newest_podcast', descending: true)
                        .snapshots(),
                    builder: (_, snapshot) {
                      if (snapshot.hasError)
                        return Text('Error = ${snapshot.error}');

                      if (snapshot.hasData) {
                        final docs = snapshot.data!.docs;
                        return Container(
                          height: 170.h,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 2,
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
                                        borderRadius:
                                            BorderRadius.circular(6.r),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(data["img"]),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 20.w, left: 16.w),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(data['title'],
                                                style: AppStyles
                                                    .videoTitleTextStyle),
                                            Text(
                                              data['subtitle'],
                                              style:
                                                  AppStyles.videoTitleTextStyle,
                                            ),
                                            SizedBox(height: 3.h),
                                            Row(
                                              children: [
                                                Text(
                                                  data['name'],
                                                  style: AppStyles
                                                      .videoSubTitleTextStyle,
                                                ),
                                                SizedBox(width: 10.w),
                                                Text("-"),
                                                SizedBox(width: 10.w),
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
                Padding(
                  padding: EdgeInsets.only(top: 24.h, left: 10.w),
                  child: navHomeCategories(
                    "Recommended Videos",
                    () => Get.toNamed(seeAllProduct,
                        arguments: SeeAllProduct('recommended_videos')),
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  height: 170.h,
                  child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection('all_products')
                        .orderBy('recommended_videos', descending: true)
                        .snapshots(),
                    builder: (_, snapshot) {
                      if (snapshot.hasError)
                        return Text('Error = ${snapshot.error}');

                      if (snapshot.hasData) {
                        final docs = snapshot.data!.docs;
                        return Container(
                          height: 170.h,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
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
                                        borderRadius:
                                            BorderRadius.circular(6.r),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(data["img"]),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 20.w, left: 16.w),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data['title'],
                                              style:
                                                  AppStyles.videoTitleTextStyle,
                                            ),
                                            SizedBox(height: 3.h),
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
                Padding(
                  padding: EdgeInsets.only(top: 24.h, left: 10.w),
                  child: navHomeCategories(
                    " Newest Blog",
                    () => Get.toNamed(seeAllProduct,
                        arguments: SeeAllProduct('home_blog')),
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  height: 140.h,
                  child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection('all_products')
                        .orderBy('home_blog', descending: true)
                        .snapshots(),
                    builder: (_, snapshot) {
                      if (snapshot.hasError)
                        return Text('Error = ${snapshot.error}');

                      if (snapshot.hasData) {
                        final docs = snapshot.data!.docs;
                        return Container(
                          height: 140.h,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (_, i) {
                                final data = docs[i].data();
                                return Padding(
                                  padding: EdgeInsets.only(left: 16.w),
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(BlogDetailPage(data));
                                    },
                                    child: Container(
                                      width: 280.w,
                                      height: 170.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6.r),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(data["img"]),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 20.w, left: 16.w),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data['title'],
                                              style:
                                                  AppStyles.videoTitleTextStyle,
                                            ),
                                            SizedBox(height: 3.h),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    bool exitApp = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackDialogBox();
        });
    return exitApp ?? false;
  }
}
