import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/ui/const/colors.dart';
import 'package:fitness/ui/route/route.dart';
import 'package:fitness/ui/style/style.dart';
import 'package:fitness/ui/view/auth/registration_screen.dart';
import 'package:fitness/ui/view/botton_nav_controller/nav_controller.dart';

import 'package:fitness/ui/view/widgets/backgroud_image.dart';

import 'package:fitness/ui/view/widgets/custom_rounded_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../busness_logic/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
    bool value = true;

  // editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroudImage(
            image:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuCtT1HXR7y0CvTUMcAki5a3RYLnunp9-_YG2FDRSw4byJxe30yWYXzjg7PRD1lMSxvzk&usqp=CAU"),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 60),
              child: Form(
                key: _formKey,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(vertical: 40.h)),
                    Image.network("https://firebasestorage.googleapis.com/v0/b/fitness-f7af3.appspot.com/o/onboariding_image%2Ffitness.png?alt=media&token=3cdc24d2-c13b-4507-bcfc-4620b031abc1", height: 200.w),
                    //textField widget
                    SizedBox(height: 10.h),

                    TextFormField(
                      autofocus: false,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Please Enter Your Email");
                        }
                        // reg expression for email validation
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return ("Please Enter a valid email");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        emailController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "E-mail",
                        border: InputBorder.none,
                        fillColor: Colors.grey[600]?.withOpacity(0.5),
                        filled: true,
                        hintStyle: TextStyle(
                          fontSize: 15.sp,
                        ),
                        prefixIcon: Icon(Icons.email_outlined),
                        prefixStyle: TextStyle(fontSize: 15.sp),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormField(
                      autofocus: false,
                      controller: passwordController,
                      obscureText: true,
                      validator: (value) {
                        RegExp regex = new RegExp(r'^.{6,}$');
                        if (value!.isEmpty) {
                          return ("Password is required for login");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid Password(Min. 6 Character)");
                        }
                      },
                      onSaved: (value) {
                        passwordController.text = value!;
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              value = !value;
                            });
                          },
                          icon: value == true
                              ? Icon(Icons.remove_red_eye, size: 25.sp)
                              : Icon(
                                  Icons.remove_red_eye_outlined,
                                  size: 25.sp,
                                )),
                        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        hintText: "Password",
                        border: InputBorder.none,
                        fillColor: Colors.grey[600]?.withOpacity(0.5),
                        filled: true,
                        hintStyle: TextStyle(
                          fontSize: 15.sp,
                        ),
                        prefixIcon: Icon(Icons.lock_outline),
                        prefixStyle: TextStyle(fontSize: 15.sp),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    //rounded widget
                    InkWell(
                      onTap: () {
                       if(_formKey.currentState!.validate()){
                           Auth().login(emailController.text,
                            passwordController.text, context);
                        }
                      },
                      child: RoundedButton(
                        color: AppColors.backgroudColor,
                        buttonName: 'Login',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed(forgot);
                          },
                          child: Text(
                            "Forget Password?",
                            style: TextStyle(color: AppColors.backgroudColor),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Don't have an account? ",
                              style: style14,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(registration);
                              },
                              child: Text(
                                "Register",
                                style: style14,
                              ),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

//login funcation

}
