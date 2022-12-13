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

class BlogDetailPage extends StatefulWidget {
  BlogDetailPage(this.detailsData);

  Map detailsData;

  @override
  _BlogDetailPageState createState() => _BlogDetailPageState();
}

class _BlogDetailPageState extends State<BlogDetailPage>
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
        'img': widget.detailsData['img'],
        'description': widget.detailsData['description'],
        'profile_img': widget.detailsData['profile_img'],
        'date': widget.detailsData['date'],
        'like': widget.detailsData['like'],
        'rating': widget.detailsData['rating'],
        'position': widget.detailsData['position'],
      },
    ).whenComplete(() {
      Fluttertoast.showToast(
          msg: "Added to favourite",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.deepOrange,
          textColor: Colors.white,
          fontSize: 13.0);
    }).catchError((error) => print("Failed to add user: $error"));
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> checkFav(
      BuildContext context) async* {
    yield* FirebaseFirestore.instance
        .collection("Users-Favourite")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection("items")
        .where("img", isEqualTo: widget.detailsData['img'])
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
      backgroundColor: Color(0XFF090D22),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 9, 15, 44),
        elevation: 0,
        title: Text("Blog Details", style: style20),
        actions: [],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 18 / 12,
                      child: Image.network(
                        widget.detailsData['img'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Content  Description",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.sp),
                              ),
                              CircleAvatar(
                                  backgroundColor: Color(0xFF202835),
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
                                                color: Colors.green,
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
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              SizedBox(width: 7.5.h),
                              Text(
                                widget.detailsData['rating'],
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              SizedBox(width: 8.h),
                              Icon(Icons.circle,
                                  size: 10.sp, color: Colors.grey),
                              SizedBox(width: 8.h),
                              Text(
                                widget.detailsData['like'],
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                              SizedBox(width: 3.h),
                              Text(
                                "likes",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 7.h),
                            child: Text(
                              widget.detailsData['description'],
                              style: TextStyle(
                                color: Color(0xFF979292),
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 15.h),
                                child: Icon(
                                  Icons.sms_outlined,
                                  size: 16,
                                  color: Color(0xFF979292),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                widget.detailsData['date'],
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
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.sp),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    widget.detailsData['position'],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14.sp),
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
                            horizontal: 15.h, vertical: 15.h),
                        child: TabBar(
                          unselectedLabelColor: AppColors.whiteColor,
                          labelColor: AppColors.greyColor,
                          indicatorColor: AppColors.backgroudColor,
                          indicatorWeight: 4,
                          labelStyle: style18(Colors.black),
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
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ReviewsTabs(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
