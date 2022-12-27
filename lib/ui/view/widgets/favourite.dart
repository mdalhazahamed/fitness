// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/ui/const/colors.dart';
import 'package:fitness/ui/style/style.dart';
import 'package:fitness/ui/view/botton_nav_controller/details/blog_details_page.dart';
import 'package:fitness/ui/view/botton_nav_controller/details/music_details.page.dart';
import 'package:fitness/ui/view/botton_nav_controller/details/video_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../style/style_screen.dart';

class FavouritePage extends StatefulWidget {
  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  List _allSongs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        elevation: 1,
        backgroundColor: AppColors.backgroudColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_circle_left_outlined, color: Colors.white),
        ),
        title: Text(
          "Favourite",
          style: AppStyles.tabTextStyle,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.w),
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('favourite_items')
                .doc(FirebaseAuth.instance.currentUser!.email)
                .collection("items")
                .snapshots(),
            builder: (_, snapshot) {
              if (snapshot.hasError) return Text('Error = ${snapshot.error}');

              if (snapshot.hasData) {
                final docs = snapshot.data!.docs;
                return Container(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: docs.length,
                      itemBuilder: (_, i) {
                        final data = docs[i].data();
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            InkWell(
                              onTap: () {
                                if (data['type'] == 'videos') {
                                  print('clicked');
                                  Get.to(VideoDetailsPage(data));
                                }
                                if (data['type'] == 'blog') {
                                  print('clicked');
                                  Get.to(BlogDetailPage(data));
                                }
                                if (data['type'] == 'podcast_videos') {
                                  print('clicked');
                                  Get.to(VideoDetailsPage(data));
                                }
                                if (data['type'] == 'music') {
                                  print('clicked');
                                  Get.to(MusicDetailsPage(data));
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.only(top: 20.h),
                                child: Container(
                                  height: 180.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      data['img'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 10,
                              top: 25,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CircleAvatar(
                                    child: IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () {
                                          setState(() {
                                            FirebaseFirestore.instance
                                                .collection("favourite_items")
                                                .doc(FirebaseAuth.instance
                                                    .currentUser!.email)
                                                .collection("items")
                                                .doc(snapshot.data!.docs[i].id)
                                                .delete();
                                          });
                                        }),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 90.h),
                                    child: Text(data['type'],
                                        textAlign: TextAlign.left,
                                        style: style20),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      }),
                );
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
