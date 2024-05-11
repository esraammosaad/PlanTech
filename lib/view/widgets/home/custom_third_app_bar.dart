import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:grad_proj/core/constants/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/constants/color.dart';

PreferredSizeWidget customAppBar(BuildContext context, {required String text}) {
  ThemeController themeController = Get.find();

  return AppBar(
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        size: getValueForScreenType(context: context, mobile: 25,tablet: 40),
        color: AppColors.kPrimaryColor,
      ),
      onPressed: () {
        Get.back();
      },
    ),
    title: Text(
      text,
      style: getValueForScreenType(context: context, mobile: Styles.textStyle20(context).copyWith(
        color: themeController.isDarkMode.value ? Colors.white70 : Colors.black,
      ),tablet: Styles.textStyle30(context).copyWith(
        color: themeController.isDarkMode.value ? Colors.white70 : Colors.black,
      )),
    ),
    centerTitle: true,
  );
}
