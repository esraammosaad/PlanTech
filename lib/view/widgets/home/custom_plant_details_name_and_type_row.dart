import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/class/them_controller.dart';
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
    return GetBuilder<ThemeController>(
      builder: (controller){
        return  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  plantData?.commonName??'',
                  style: Styles.textStyle18.copyWith(
                      color: controller.isDarkMode.value ? Colors.white : Colors.black

                  ),


                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: AlignmentDirectional.centerStart,
              child: Text(" Type ${plantData?.type??''}",
                  style: Styles.textStyle12.copyWith(
                    color: controller.isDarkMode.value ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w300,

                  )),
            ),
          ],
        );
      },
    );
  }
}
