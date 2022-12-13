import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/ui/const/colors.dart';
import 'package:fitness/ui/style/style.dart';
import 'package:fitness/ui/view/botton_nav_controller/nav_controller.dart';
import 'package:fitness/ui/view/widgets/backgroud_image.dart';
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
  final _auth = FirebaseAuth.instance;

  final TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroudImage(
            image: "https://www.nawpic.com/media/2020/gym-nawpic.webp"),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 200.h),
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
                      decoration:
                          myDecoration("E-mail", Icon(Icons.email_outlined)),
                    ),
                  ),
                  //rounded widget
                  SizedBox(height: 5.h),
                  InkWell(
                    onTap: () {
                      _auth.sendPasswordResetEmail(
                          email: emailController.text.toString());
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
        ),
      ],
    );
  }
}
