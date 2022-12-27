import 'dart:io';

import 'package:better_player/better_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/ui/const/colors.dart';
import 'package:fitness/ui/style/style.dart';

import 'package:fitness/ui/view/botton_nav_controller/details/reviews_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../style/style_screen.dart';

class VideoDetailsPage extends StatefulWidget {
  VideoDetailsPage(this.detailsData);

  Map detailsData;

  @override
  _VideoDetailsPageState createState() => _VideoDetailsPageState();
}

class _VideoDetailsPageState extends State<VideoDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

//add to favourite
  addtoFavourite() async {
    FirebaseFirestore.instance
        .collection('favourite_items')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("items")
        .doc()
        .set(
      {
        'name': widget.detailsData['name'],
        'title': widget.detailsData['title'],
        'subtite': widget.detailsData['type'],
        'rating': widget.detailsData['rating'],
        'img': widget.detailsData['img'],
        'profile_img': widget.detailsData['profile_img'],
        'videos': widget.detailsData['videos'],
        'date': widget.detailsData['date'],
        'like': widget.detailsData['like'],
        'position': widget.detailsData['position'],
        'description': widget.detailsData['description'],
        'type': widget.detailsData['type'],
      },
    ).whenComplete(() {
      Fluttertoast.showToast(
          msg: "Added to favourite",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.deepOrange,
          textColor: Colors.grey,
          fontSize: 13.0);
    }).catchError((error) => print("Failed to add user: $error"));
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> checkFav(
      BuildContext context) async* {
    yield* FirebaseFirestore.instance
        .collection("favourite_items")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("items")
        .orderBy("img", descending: widget.detailsData['img'])
        .snapshots();
  }

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: Text(widget.detailsData['type'], style: AppStyles.bigTextStyle),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_circle_left_outlined,
          ),
        ),
        actions: [],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: BetterPlayer.network(
                        widget.detailsData['videos'],
                        betterPlayerConfiguration: BetterPlayerConfiguration(
                          aspectRatio: 16 / 9,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Content  Description",
                                style: TextStyle(fontSize: 20.sp),
                              ),
                              CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  child: StreamBuilder<
                                      QuerySnapshot<Map<String, dynamic>>>(
                                    stream: checkFav(context),
                                    builder: (context, snapshot) {
                                      if (snapshot.data == null)
                                        return Text("");
                                      return IconButton(
                                        icon: snapshot.data!.docs.length == 0
                                            ? Icon(
                                                Icons.favorite_outline,
                                              )
                                            : Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              ),
                                        onPressed: () {
                                          snapshot.data!.docs.length == 0
                                              ? addtoFavourite()
                                              : Fluttertoast.showToast(
                                                  msg: "Already Added",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity:
                                                      ToastGravity.SNACKBAR,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor:
                                                      Colors.deepOrange,
                                                  textColor: Colors.white,
                                                  fontSize: 13.0);
                                        },
                                      );
                                    },
                                  )),
                            ],
                          ),
                          SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              SizedBox(width: 7.5.h),
                              Text(
                                widget.detailsData['rating'],
                                style: TextStyle(fontSize: 15.sp),
                              ),
                              SizedBox(width: 8.h),
                              Icon(Icons.circle,
                                  size: 10.sp, color: Colors.grey),
                              SizedBox(width: 8.h),
                              Text(
                                widget.detailsData['like'],
                                style: TextStyle(fontSize: 15.sp),
                              ),
                              SizedBox(width: 3.h),
                              Text(
                                "likes",
                                style: TextStyle(fontSize: 15.sp),
                              ),
                            ],
                          ),
                          SizedBox(height: 26.h),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.dumbbell,
                                size: 12.sp,
                                color: Color(0xFF979292),
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                "5 min Video / 3 min Audio",
                                style: TextStyle(
                                  color: Color(0xFF979292),
                                  fontSize: 12.sp,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 7.h),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 5.h),
                                child: Icon(
                                  Icons.sms_outlined,
                                  size: 16,
                                  color: Color(0xFF979292),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                widget.detailsData['time'],
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Color(0xFF979292),
                                ),
                              ),
                              SizedBox(height: 8.h),
                            ],
                          ),
                          SizedBox(height: 21.h),
                          Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.r),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        widget.detailsData['profile_img']),
                                  ),
                                ),
                              ),
                              SizedBox(width: 16.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.detailsData['name'],
                                    style: TextStyle(fontSize: 16.sp),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    widget.detailsData['position'],
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  // height: 50,
                  width: MediaQuery.of(context).size.height,

                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.h, vertical: 1.h),
                        child: TabBar(
                          labelColor: AppColors.backgroudColor,
                          unselectedLabelColor: Colors.grey,
                          indicatorWeight: 4,
                          indicatorColor: AppColors.backgroudColor,
                          labelStyle: style18(Colors.white),
                          controller: tabController,
                          tabs: [
                            Tab(
                              text: "Releted",
                            ),
                            Tab(
                              text: 'Reviews',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Center(
                        child: Text(
                          "Emty",
                        ),
                      ),
                      ReviewsTabs(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
