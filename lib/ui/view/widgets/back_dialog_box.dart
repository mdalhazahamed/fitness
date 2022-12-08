import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../botton_nav_controller/splash_screen.dart';

class BackDialogBox extends StatelessWidget {
  const BackDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        "Are you sure want to close application?",
        style: TextStyle(fontSize: 14.sp),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text("No"),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => SplashScreen()));
          },
          child: Text("Yes"),
        ),
      ],
    );
  }
}
