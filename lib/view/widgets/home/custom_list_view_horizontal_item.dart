import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/styles.dart';

class CustomListViewHorizontalItem extends StatelessWidget {
  const CustomListViewHorizontalItem({
    super.key,
    required this.originList,
    required this.index,
  });

  final List<String>? originList;
  final int index;

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Container(
      margin:  EdgeInsets.only(right: getValueForScreenType(context: context, mobile: 5,tablet: 12)),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
            color: themeController.isDarkMode.value
                ? AppColors.kPrimaryColor
                : Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
      child: FittedBox(
          alignment: Alignment.center,
          fit: BoxFit.scaleDown,
          child: Text(
            originList?[index] ?? "",
            style: getValueForScreenType<TextStyle>(context: context, mobile: Styles.textStyle12(context).copyWith(
                color: themeController.isDarkMode.value
                    ? Colors.white
                    : AppColors.kPrimaryColor),tablet: Styles.textStyle30(context).copyWith(
                color: themeController.isDarkMode.value
                    ? Colors.white
                    : AppColors.kPrimaryColor),)
          )),
    );
  }
}
