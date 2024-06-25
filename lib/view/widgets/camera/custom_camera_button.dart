import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/constants/color.dart';
class CustomCameraButton extends StatelessWidget {
  const CustomCameraButton({
    super.key, required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    ThemeController themeController=Get.find();
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: AppColors.kPrimaryColor,
        radius: getValueForScreenType(context: context, mobile: 35,tablet: 60),
        child: CircleAvatar(
          backgroundColor: themeController.isDarkMode.value?Colors.black38:Colors.white,
          radius:  getValueForScreenType(context: context, mobile: 29,tablet: 47),
          child: CircleAvatar(
            radius:  getValueForScreenType(context: context, mobile: 24,tablet: 40),
            backgroundColor: AppColors.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
