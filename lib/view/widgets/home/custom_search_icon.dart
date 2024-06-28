import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Container(
      width: getValueForScreenType(context: context, mobile: 40, tablet: 70),
      height: getValueForScreenType(context: context, mobile: 40, tablet: 70),
      decoration: BoxDecoration(
        color: themeController.isDarkMode.value
            ? Colors.black26
            : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(
        Icons.search,
        color:
            themeController.isDarkMode.value ? Colors.white : Colors.grey[500],
        size: getValueForScreenType(context: context, mobile: 30, tablet: 45),
      ),
    );
  }
}
