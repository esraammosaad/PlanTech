import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/constants/styles.dart';
import '../../../data/models/plants_details_model.dart';

class CustomPlantDetailsNameAndTypeRow extends StatelessWidget {
  const CustomPlantDetailsNameAndTypeRow({
    super.key,
    required this.plantData,
  });

  final PlantsDetailsModel? plantData;

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Obx(
    () {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  plantData?.commonName ?? '',
                  style: getValueForScreenType(context: context, mobile: Styles.textStyle20(context).copyWith(
                      color: themeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black,fontWeight: FontWeight.w300),tablet: Styles.textStyle36(context).copyWith(
                      color: themeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black,fontWeight: FontWeight.w300)),),
              ),
            ),
            const SizedBox(width:8,),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: AlignmentDirectional.centerStart,
              child: Text(" Type ${plantData?.type ?? ''}",
                  style: getValueForScreenType(context: context, mobile: Styles.textStyle14(context).copyWith(
                      color: themeController.isDarkMode.value
                          ? Colors.white70
                          : Colors.black,fontWeight: FontWeight.bold),tablet: Styles.textStyle20(context).copyWith(
                      color: themeController.isDarkMode.value
                          ? Colors.white70
                          : Colors.black,fontWeight: FontWeight.bold)),)),

          ],
        );
      }
    );
  }
}
