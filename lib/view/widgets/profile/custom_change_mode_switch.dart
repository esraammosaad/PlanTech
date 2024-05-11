import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/constants/color.dart';
import '../../../core/class/them_controller.dart';

class CustomChangeModeSwitch extends StatefulWidget {
  const CustomChangeModeSwitch({super.key});

  @override
  State<CustomChangeModeSwitch> createState() => _CustomChangeModeSwitchState();
}

class _CustomChangeModeSwitchState extends State<CustomChangeModeSwitch> {
   ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ObxValue(
        (data) => Switch(
            activeColor: AppColors.kPrimaryColor,
            value: themeController.isDarkMode.value,
            onChanged: (value) {
              themeController.toggleTheme(value);
              debugPrint(value.toString());
              debugPrint(themeController.isDarkMode.value.toString());
            }),
        false.obs);
  }
}
