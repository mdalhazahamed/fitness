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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

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
                "https://files.oyebesmartest.com/uploads/preview/insta-55872689-64ehqpepx2.jpeg"),
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
                    Padding(padding: EdgeInsets.symmetric(vertical: 60.h)),
        
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
                        signIn(emailController.text, passwordController.text);
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
                              style: style14(Colors.white),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(registration);
                              },
                              child: Text(
                                "Register",
                                style: style14(Colors.white),
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

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Login Successful"),
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => BottonNavController()))
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.maessage);
      });
    }
  }
}
