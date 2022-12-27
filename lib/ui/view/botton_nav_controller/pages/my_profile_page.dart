import 'package:fitness/ui/const/colors.dart';
import 'package:fitness/ui/style/style.dart';

import 'package:fitness/ui/view/botton_nav_controller/pages/profile/my_challenges.dart';

import 'package:fitness/ui/view/botton_nav_controller/details/reviews_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../auth/login_screen.dart';
import '../../widgets/back_dialog_box.dart';
import '../details/profile_details.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile>
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
    return WillPopScope(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 32.h, left: 16.w),
                    child: Text("Good Morning,",
                        style: TextStyle(fontSize: 24.sp)),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 15.h),
                child: TabBar(
                  labelColor: AppColors.backgroudColor,
                  unselectedLabelColor: Colors.grey,
                  indicatorWeight: 4,
                  indicatorColor: AppColors.backgroudColor,
                  labelStyle: style18(Colors.white),
                  controller: tabController,
                  tabs: [
                    Tab(
                      text: 'My Challenges',
                    ),
                    Tab(
                      text: 'Profile Details',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    MyChallenges(),
                    ProfileDetails(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onWillPop: () => _onBackButtonPressed(context),
    );
  }
}

Future<bool> _onBackButtonPressed(BuildContext context) async {
  bool exitApp = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackDialogBox();
      });
  return exitApp ?? false;
}
