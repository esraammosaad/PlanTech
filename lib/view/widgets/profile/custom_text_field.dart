import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:grad_proj/core/constants/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/constants/color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
    required this.controller,
    required this.widget,
  });
  final String text;
  final Widget widget;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextField(
          style: getValueForScreenType(
              context: context,
              mobile: Styles.textStyle14(context).copyWith(
                  color: themeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black),
              tablet: Styles.textStyle25(context).copyWith(
                  color: themeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black,
                  fontWeight: FontWeight.w300)),
          cursorColor: AppColors.kPrimaryColor,
          controller: controller,
          decoration: InputDecoration(
              hintText: text,
              hintStyle: getValueForScreenType(
                  context: context,
                  mobile: Styles.textStyle14(context).copyWith(
                      color: themeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black),
                  tablet: Styles.textStyle25(context).copyWith(
                      color: themeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.w300)),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.kPrimaryColor)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.kPrimaryColor))),
        ),
        widget,
      ],
    );
  }
}

class CustomConfirmEditProfileButton extends StatelessWidget {
  const CustomConfirmEditProfileButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: getValueForScreenType(context: context, mobile: 60, tablet: 120),
        height: getValueForScreenType(context: context, mobile: 25, tablet: 45),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.kPrimaryColor),
        ),
        child: Center(
            child: Text(
          'Confirm',
          style: getValueForScreenType(
              context: context,
              mobile: Styles.textStyle10(context).copyWith(
                  color: themeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black),
              tablet: Styles.textStyle18(context).copyWith(
                  color: themeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black,
                  fontWeight: FontWeight.w500)),
        )),
      ),
    );
  }
}
