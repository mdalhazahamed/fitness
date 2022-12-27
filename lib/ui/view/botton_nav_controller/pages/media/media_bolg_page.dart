import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/ui/route/route.dart';
import 'package:fitness/ui/view/botton_nav_controller/pages/view_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../details/video_details_page.dart';

class MediaBlogPage extends StatefulWidget {
  const MediaBlogPage({Key? key}) : super(key: key);

  @override
  State<MediaBlogPage> createState() => _MediaBlogPageState();
}

class _MediaBlogPageState extends State<MediaBlogPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10.h),
          SizedBox(
            height: 650.h,
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('all_products')
                  .where('home_blog', isEqualTo: true)
                  .snapshots(),
              builder: (_, snapshot) {
                if (snapshot.hasError) return Text('Error = ${snapshot.error}');

                if (snapshot.hasData) {
                  final docs = snapshot.data!.docs;
                  return GridView.builder(
                      itemCount: docs.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (_, i) {
                        final data = docs[i].data();
                        return InkWell(
                          onTap: () {
                                      Get.to(VideoDetailsPage(data));
                                    },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 10.w),
                            margin: EdgeInsets.symmetric(
                                vertical: 8.h, horizontal: 10.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage((data['img'][0])),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.only(bottom: 48.h, left: 16.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(data['name'],
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  Text(data['food'],
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.white)),
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
        ],
      ),
    );
  }
}
