import 'package:fitness/ui/const/colors.dart';
import 'package:fitness/ui/view/widgets/custom_rounded_field.dart';
import 'package:fitness/ui/view/widgets/custom_email_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

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
                padding: EdgeInsets.symmetric(vertical: 60.h),
                child: Image.asset("assets/forgot.png", width: 100.w),
              ),
              //textField widget
              CustomEmail(
                color: Colors.grey,
                hint: 'Moblie No',
                inputType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
              ),

              //rounded widget
              SizedBox(height: 5.h),
              InkWell(
                onTap: () {},
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
