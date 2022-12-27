import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/ui/const/colors.dart';
import 'package:fitness/ui/route/route.dart';
import 'package:fitness/ui/style/style.dart';
import 'package:fitness/ui/theme/app_theme.dart';
import 'package:fitness/ui/view/auth/login_screen.dart';
import 'package:fitness/ui/view/botton_nav_controller/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProfileDetails extends StatefulWidget {
  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  RxBool darkMode = false.obs;
  final box = GetStorage();

  List _allSongs = [];

  Future logOut(context) async {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Are you sure want to logout?"),
              content: Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut().then(
                            (value) => Fluttertoast.showToast(
                                msg: "Logout Successfull."),
                          );
                      await box.remove('uid');
                      Get.toNamed(splash);
                    },
                    child: const Text("Yes"),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  ElevatedButton(
                    onPressed: () => Get.back(),
                    child: const Text("No"),
                  ),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          //for circle avtar image
          _getHeader(),
          SizedBox(
            height: 8.h,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.80, //80% of width,
            child: Padding(
              padding: EdgeInsets.only(left: 40.w),
              child: Row(
                children: [
                  Icon(Icons.email, size: 20.sp),
                  SizedBox(width: 8.w),
                  Text(
                    FirebaseAuth.instance.currentUser!.email.toString(),
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5.h),

          _detailsCard(),

          Spacer(),
          InkWell(
            onTap: () => logOut(context),
            child: Container(
                color: Color.fromARGB(255, 48, 6, 3),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Logout",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  ),
                )),
          ),
        ],
      )),
    );
  }

  Widget _getHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 120.h,
            width: 120.w,
            decoration: BoxDecoration(
                //borderRadius: BorderRadius.all(Radius.circular(10.0)),
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "https://c4.wallpaperflare.com/wallpaper/451/590/341/look-face-hairstyle-profile-male-hd-wallpaper-preview.jpg",
                    ))
                // color: Colors.orange[100],
                ),
          ),
        ),
      ],
    );
  }

  Widget _detailsCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            //row for each deatails

            Divider(
              height: 0.6,
            ),

            Divider(
              height: 0.6,
              color: Colors.white38,
            ),
            ListTile(
              leading: Icon(Icons.topic),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Change Theme"),
                  Obx(
                    () => Switch(
                      value: darkMode.value,
                      onChanged: (bool value) {
                        darkMode.value = value;
                        Get.changeTheme(darkMode.value == false
                            ? AppTheme().lightTheme(context)
                            : AppTheme().darkTheme(context));
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
