import 'dart:io';

import 'package:fitness/ui/const/colors.dart';
import 'package:fitness/ui/style/style.dart';

import 'package:fitness/ui/view/widgets/tabs/related_tabs.dart';
import 'package:fitness/ui/view/widgets/tabs/reviews_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ViewDetails extends StatefulWidget {
  const ViewDetails({Key? key}) : super(key: key);

  @override
  _ViewDetailsState createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(height: 36.h),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Container(
                      height: 250.h,
                      width: double.infinity.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://www.mensjournal.com/wp-content/uploads/mf/imgs-mesomorph-inarticle.gif"),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 43.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Content  Area,",
                              style: TextStyle(
                                  fontSize: 25.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              "Video, Audio,",
                              style: TextStyle(
                                  fontSize: 25.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              "Picture, text,",
                              style: TextStyle(
                                  fontSize: 25.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.sp),
                              ),
                              CircleAvatar(
                                backgroundColor: Color(0xFF202835),
                                child: Icon(Icons.favorite_border_outlined),
                              ),
                            ],
                          ),
                          SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              SizedBox(width: 7.5.h),
                              Text(
                                "4.9",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              SizedBox(width: 8.h),
                              Icon(Icons.circle,
                                  size: 10.sp, color: Colors.grey),
                              SizedBox(width: 8.h),
                              Text(
                                "1500",
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
                                "3 min Read Time",
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
                                        "https://pbs.twimg.com/profile_images/1485050791488483328/UNJ05AV8_400x400.jpg"),
                                  ),
                                ),
                              ),
                              SizedBox(width: 16.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Content Creator",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.sp),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    "Profession",
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
              ),
              Expanded(
                flex: 1,
                child: Container(
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
                          labelStyle: style16(Colors.black),
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
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    RelatedTabs(),
                    ReviewsTabs(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
