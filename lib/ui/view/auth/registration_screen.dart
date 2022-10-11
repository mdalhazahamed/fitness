import 'dart:ui';

import 'package:fitness/ui/const/colors.dart';
import 'package:fitness/ui/route/route.dart';
import 'package:fitness/ui/style/style.dart';
import 'package:fitness/ui/view/auth/login_screen.dart';
import 'package:fitness/ui/view/auth/registration_screen.dart';
import 'package:fitness/ui/view/widgets/custom_name_field.dart';
import 'package:fitness/ui/view/widgets/custom_password_field.dart';
import 'package:fitness/ui/view/widgets/custom_rounded_field.dart';
import 'package:fitness/ui/view/widgets/custom_email_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE5E5E5),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 40.h),
                child: Image.asset("assets/register.png", width: 250.w),
              ),

              //textField widget
              CustomName(hint: "Name", color: Colors.grey),
              CustomEmail(
                color: Colors.grey,
                hint: 'E-mail',
                inputType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
              ),
              CustomEmail(
                color: Colors.grey,
                hint: 'Mobile No',
                inputType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
              ),
              CustomPassword(
                hint: 'Password',
                inputAction: TextInputAction.next,
              ),

              //rounded widget
              InkWell(
                onTap: () {
                  Get.toNamed(bottonNavController);
                },
                child: RoundedButton(
                  color: AppColors.backgroudColor,
                  buttonName: 'Register',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          "Login",
                          style: style14,
                        ),
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
