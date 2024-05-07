import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/class/them_controller.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/fonts.dart';
import '../../../core/constants/styles.dart';
import '../../../data/models/popular_questions_model.dart';
import '../home/custom_cached_network_image.dart';
class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({
    super.key, required this.questions, required this.isInitiallyExpanded,
  });
  final Questions questions;
  final bool isInitiallyExpanded;

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();

    return ExpansionTile(
      initiallyExpanded: isInitiallyExpanded,
        title: Text(
          questions
              .question ??
              '',
          style: getValueForScreenType(context: context, mobile: Styles.textStyle18(context).copyWith(
              fontFamily: AppFonts.kArabicFont,
              fontWeight: FontWeight.w500,color:
          themeController.isDarkMode.value
              ? Colors.white
              : Colors.black),tablet: Styles.textStyle25(context).copyWith(
              fontFamily: AppFonts.kArabicFont,
              fontWeight: FontWeight.w500,color:
          themeController.isDarkMode.value
              ? Colors.white
              : Colors.black)),
        ),
        backgroundColor:
        themeController.isDarkMode.value
            ? Colors.black26
            : AppColors.backgroundColor,
        collapsedBackgroundColor:
        themeController.isDarkMode.value
            ? Colors.black26
            : AppColors.backgroundColor,
        childrenPadding:
        const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),
        collapsedIconColor:
        AppColors.kPrimaryColor,
        iconColor: AppColors.kPrimaryColor,
        children: [
          Text(
            questions
                .answer ??
                '',
            style: getValueForScreenType(context: context, mobile: Styles.textStyle14(context).copyWith(
                color: AppColors.greyColor,
                fontFamily: AppFonts.kArabicFont,
                fontWeight: FontWeight.bold),tablet: Styles.textStyle20(context).copyWith(
                color: AppColors.greyColor,
                fontFamily: AppFonts.kArabicFont,
                fontWeight: FontWeight.bold)),
            textAlign: TextAlign.start,
          ),
          CustomCachedNetworkImage(
              image: questions
                  .defaultImage
                  ?.mediumUrl)
        ]);
  }
}
