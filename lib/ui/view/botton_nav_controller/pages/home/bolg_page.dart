import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/ui/route/route.dart';
import 'package:fitness/ui/view/botton_nav_controller/details/blog_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../details/video_details_page.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10.h),
          AspectRatio(
            aspectRatio: 0.7,
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
                          onTap: () => Get.toNamed(blogDetailsPage,
                              arguments: BlogDetailPage(data)),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 10.w),
                            margin: EdgeInsets.symmetric(
                                vertical: 8.h, horizontal: 10.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage((data['img'])),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.only(bottom: 48.h, left: 16.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(data['title'],
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  Text(data['subtitle'],
                                      style: TextStyle(
                                          fontSize: 15.sp,
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
