import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/ui/const/colors.dart';
import 'package:fitness/ui/view/botton_nav_controller/nav_controller.dart';
import 'package:fitness/ui/view/widgets/custom_rounded_field.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();

  int opt = 0;

  @override
  void initState() {
    super.initState();
    registerAccount();
  }

  void registerAccount() {
    if (opt == 0) {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: "alhazbci99@gmail.com",
        password: "alhaz557699nci",
      );
    } else {
      FirebaseAuth.instance.signInWithEmailAndPassword(
        email: "alhazbci99@gmail.com",
        password: "alhaz557699bci",
      );
    }
  }

  void verifyEmail() {
    User? user = FirebaseAuth.instance.currentUser;
    if (!(user!.emailVerified)) {
      user.sendEmailVerification();
    }
  }

  void sendRestPassword() {
    User? user = FirebaseAuth.instance.currentUser;

    FirebaseAuth.instance.sendPasswordResetEmail(
      email: user!.email.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 60.h),
                child: Image.asset("assets/forgot.png", width: 100.w),
              ),
              //textField widget
              Form(
                key: formKey,
                child: TextFormField(
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
                    prefixIcon: Icon(Icons.mail),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              //rounded widget
              SizedBox(height: 5.h),
              InkWell(
                onTap: () {
                  verifyEmail();
                },
                child: RoundedButton(
                  color: AppColors.backgroudColor,
                  buttonName: 'Send',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
