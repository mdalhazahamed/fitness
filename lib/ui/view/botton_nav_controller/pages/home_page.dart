import 'package:fitness/ui/const/colors.dart';
import 'package:fitness/ui/style/style.dart';
import 'package:fitness/ui/view/botton_nav_controller/pages/home/overview_page.dart';


import 'package:fitness/ui/view/widgets/details/reviews_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home/bolg_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
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
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 32.h, left: 16.w),
                  child: Text("Good Morning,",
                      style: TextStyle(fontSize: 20.sp, color: Colors.white)),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                indicatorWeight: 4,
                indicatorColor: AppColors.backgroudColor,
                labelStyle: style16(Colors.black),
                controller: tabController,
                tabs: [
                  Tab(
                    text: 'Overview',
                  ),
                  Tab(
                    text: 'Blog',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [OverviewPage(), BolgPage()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
