import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPassword extends StatefulWidget {
  const CustomPassword({
    Key? key,
    required this.hint,
    this.inputType,
    this.inputAction,
  }) : super(key: key);

  final String hint;
  final TextInputType? inputType;
  final TextInputAction? inputAction;

  @override
  State<CustomPassword> createState() => _CustomPasswordState();
}

class _CustomPasswordState extends State<CustomPassword> {
  final TextEditingController passwordController = new TextEditingController();
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
            padding: EdgeInsets.only(left: 20.w),
            child: TextFormField(
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
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hint,
                hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
              obscureText: true,
              keyboardType: widget.inputType,
              textInputAction: widget.inputAction,
            ),
          ),
        ),
      ),
    );
  }
}
