import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:grad_proj/data/models/plants_details_model.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/styles.dart';
import 'custom_plant_details_name_and_type_row.dart';

class CustomPlantsDetailsWidgets extends StatelessWidget {
  const CustomPlantsDetailsWidgets({
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
            CustomPlantDetailsNameAndTypeRow(plantData: plantData),
            const SizedBox(
              height: 12,
            ),
            Text(
              plantData?.description ?? "",
              style: Styles.textStyle12.copyWith(
                  color: themeController.isDarkMode.value
                      ? Colors.white70
                      : AppColors.greyColor,
                  fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              height: 16,
            ),
            FittedBox(
              alignment: AlignmentDirectional.centerStart,
              fit: BoxFit.scaleDown,
              child: Text(
                "Scientific Name :  ${plantData?.scientificName ?? ""}",
                style: Styles.textStyle12.copyWith(
                    fontWeight: FontWeight.bold,
                    color: themeController.isDarkMode.value
                        ? Colors.white
                        : Colors.black),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Other Name :  ${plantData?.otherName ?? ""}",
              style: Styles.textStyle12.copyWith(
                  fontWeight: FontWeight.bold,
                  color: themeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              plantData?.dimension ?? "",
              style: Styles.textStyle12.copyWith(
                  fontWeight: FontWeight.bold,
                  color: themeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black),
            ),
            const SizedBox(height: 16,),
            Text(
              "Origin :",
              style: Styles.textStyle18
                  .copyWith(fontWeight: FontWeight.w600,color: themeController.isDarkMode.value
                  ? Colors.white70
                  :Colors.black),
            ),
            const SizedBox(height: 8,),


          ],
        );
      }),
    );

  }
}
