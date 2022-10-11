import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEmail extends StatefulWidget {
  const CustomEmail(
      {Key? key,
      required this.hint,
      this.inputType,
      this.inputAction,
      this.color})
      : super(key: key);

  final String hint;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final color;

  @override
  State<CustomEmail> createState() => _CustomEmailState();
}

class _CustomEmailState extends State<CustomEmail> {
  final TextEditingController emailController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0.h),
      child: Container(
        height: size.height * 0.07.h,
        width: double.infinity.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: TextFormField(
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
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hint,
                hintStyle: TextStyle(fontSize: 14.sp, color: widget.color),
              ),
              keyboardType: widget.inputType,
              textInputAction: widget.inputAction,
            ),
          ),
        ),
      ),
    );
  }
}
