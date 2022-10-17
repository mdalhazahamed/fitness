import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitness/ui/const/colors.dart';
import 'package:fitness/ui/model/user_model.dart';
import 'package:fitness/ui/route/route.dart';
import 'package:fitness/ui/style/style.dart';
import 'package:fitness/ui/view/auth/login_screen.dart';
import 'package:fitness/ui/view/auth/registration_screen.dart';
import 'package:fitness/ui/view/botton_nav_controller/nav_controller.dart';
import 'package:fitness/ui/view/botton_nav_controller/pages/home_page.dart';

import 'package:fitness/ui/view/widgets/custom_rounded_field.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  final firstNameEditingController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE5E5E5),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Form(
            key: _formKey,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 60.h),
                  child: Image.asset("assets/login.png", width: 250.w),
                ),

                //textField widget
                SizedBox(
                  height: 10.h,
                ),
                TextFormField(
                  autofocus: false,
                  controller: firstNameEditingController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    RegExp regex = new RegExp(r'^.{6,}$');
                    if (value!.isEmpty) {
                      return ("First Name cannot be Empty");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter Valid name(Min. 6 Character)");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    firstNameEditingController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Name",
                    hintStyle: TextStyle(
                      fontSize: 15.sp,
                    ),
                    prefixIcon: Icon(Icons.person_outline),
                    prefixStyle: TextStyle(fontSize: 15.sp),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "E-mail",
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(
                      fontSize: 15.sp,
                    ),
                    prefixIcon: Icon(Icons.lock_outline),
                    prefixStyle: TextStyle(fontSize: 15.sp),
                  ),
                ),
                SizedBox(height: 10.h),
                //rounded widget
                InkWell(
                  onTap: () {
                    signUp(emailController.text, passwordController.text);
                  },
                  child: RoundedButton(
                    color: AppColors.backgroudColor,
                    buttonName: 'Register',
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
                        Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Text(
                            "login",
                            style: style14(Colors.black),
                          ),
                        )
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    // calling our firebastore
    //calling our user model
    //sending thase values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    //writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = firstNameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created seccessfully :)");

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => BottonNavController()),
        (route) => false);
  }
}
