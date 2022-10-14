import 'package:fitness/ui/const/colors.dart';
import 'package:fitness/ui/route/route.dart';
import 'package:fitness/ui/style/style.dart';
import 'package:fitness/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileDetails extends StatefulWidget {
  @override
  _ProfileDetailsState createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  RxBool darkMode = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        children: [
          //for circle avtar image
          _getHeader(),
          SizedBox(
            height: 8.h,
          ),
          _profileName(
            "Md Alhaz Ahammed",
          ),
          SizedBox(
            height: 10.h,
          ),
          _heading("Personal Details"),
          SizedBox(
            height: 6.h,
          ),
          _detailsCard(),

          Spacer(),
          logoutButton()
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
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                //borderRadius: BorderRadius.all(Radius.circular(10.0)),
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage("assets/alhaz.png"))
                // color: Colors.orange[100],
                ),
          ),
        ),
      ],
    );
  }

  Widget _profileName(String name) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Center(
        child: Text(
          name,
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  Widget _heading(String heading) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Text(
        heading,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }

  Widget _detailsCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.black,
        elevation: 4,
        child: Column(
          children: [
            //row for each deatails
            ListTile(
              leading: Icon(Icons.email, color: Colors.white),
              title: Text("alhazbci99@gmail.com",
                  style: TextStyle(color: Colors.white)),
            ),
            Divider(
              height: 0.6,
              color: Colors.white,
            ),
            ListTile(
              leading: Icon(Icons.phone, color: Colors.white),
              title: Text("01776265012", style: TextStyle(color: Colors.white)),
            ),
            Divider(
              height: 0.6,
              color: Colors.white38,
            ),
            ListTile(
              leading: Icon(Icons.language, color: Colors.white),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Eng-Ban",
                    style: TextStyle(color: Colors.white),
                  ),
                  Obx(
                    () => Switch(
                        value: darkMode.value,
                        onChanged: (bool value) {
                          Get.changeTheme(
                            darkMode.value == false
                                ? AppTheme().lightTheme(context)
                                : AppTheme().darkTheme(context),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Divider(
              height: 0.6,
              color: Colors.white38,
            ),
            ListTile(
              leading: Icon(Icons.topic, color: Colors.white),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Change Theme", style: TextStyle(color: Colors.white)),
                  Obx(
                    () => Switch(
                        value: darkMode.value,
                        onChanged: (bool value) {
                          Get.changeTheme(
                            darkMode.value == false
                                ? AppTheme().lightTheme(context)
                                : AppTheme().darkTheme(context),
                          );
                        }),
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

Widget logoutButton() {
  return InkWell(
    onTap: () {
      Get.toNamed(login);
    },
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
  );
}
