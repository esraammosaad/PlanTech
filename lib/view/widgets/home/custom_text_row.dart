import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/constants/styles.dart';

class CustomTextRow extends StatelessWidget {
  const CustomTextRow({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: getValueForScreenType(
                context: context,
                mobile: Styles.textStyle18(context).copyWith(
                    fontWeight: FontWeight.w800,
                    color: themeController.isDarkMode.value
                        ? Colors.white70
                        : Colors.black),
                tablet: Styles.textStyle25(context).copyWith(
                    fontWeight: FontWeight.bold,
                    color: themeController.isDarkMode.value
                        ? Colors.white70
                        : Colors.black)),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              'See All',
              style: getValueForScreenType(
                  context: context,
                  mobile: Styles.textStyle16(context).copyWith(
                      color: Colors.grey,
                      textBaseline: TextBaseline.alphabetic),
                  tablet: Styles.textStyle20(context).copyWith(
                      color: Colors.grey,
                      textBaseline: TextBaseline.alphabetic,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      );
    });
  }
}
