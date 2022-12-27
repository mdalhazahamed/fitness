import 'package:fitness/ui/const/colors.dart';
import 'package:fitness/ui/style/style.dart';
import 'package:fitness/ui/view/botton_nav_controller/pages/challenges/meal_page.dart';

import 'package:fitness/ui/view/widgets/back_dialog_box.dart';

import 'package:fitness/ui/view/botton_nav_controller/pages/challenges/quiz_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'challenges/execrise_page.dart';

class ChallangePage extends StatefulWidget {
  const ChallangePage({super.key});

  @override
  State<ChallangePage> createState() => _ChallangePageState();
}

class _ChallangePageState extends State<ChallangePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
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
        appBar: AppBar(
          toolbarHeight: 30.h,
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [],
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
                      text: 'Meal',
                    ),
                    Tab(
                      text: 'Excise',
                    ),
                    Tab(
                      text: 'Quiz',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    MealPage(),
                    ExecrisePage(),
                    QuizPage(),
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
