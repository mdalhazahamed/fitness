import 'package:fitness/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  RxBool darkMode = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Switch(
            value: darkMode.value,
            onChanged: (bool value) {
              Get.changeTheme(darkMode.value == false
                  ? AppTheme().lightTheme(context)
                  : AppTheme().darkTheme(context));
            },
          ),
        ),
      ),
    );
  }
}
