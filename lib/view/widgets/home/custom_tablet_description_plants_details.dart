import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:grad_proj/core/constants/fonts.dart';
import 'package:grad_proj/data/models/plants_details_model.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/styles.dart';

class CustomTabletDescriptionPlantsDetails extends StatelessWidget {
  const CustomTabletDescriptionPlantsDetails({
    super.key,
    required this.plantData,
  });
  final PlantsDetailsModel? plantData;

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              plantData?.description ?? "",
              style: getValueForScreenType<TextStyle>(
                  context: context,
                  mobile: Styles.textStyle12(context).copyWith(
                      color: themeController.isDarkMode.value
                          ? Colors.white
                          : AppColors.greyColor,
                      fontWeight: FontWeight.w500),
                  tablet: Styles.textStyle20(context).copyWith(
                      color: themeController.isDarkMode.value
                          ? Colors.white
                          : AppColors.greyColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFonts.kArabicFont)),
            ),


          ],
        );
      }),
    );
  }
}
