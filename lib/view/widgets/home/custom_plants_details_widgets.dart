import 'package:flutter/material.dart';
import 'package:grad_proj/data/models/plants_details_model.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/styles.dart';
import 'custom_plant_details_name_and_type_row.dart';

class CustomPlantsDetailsWidgets extends StatelessWidget {
  const CustomPlantsDetailsWidgets({
    super.key,
    required this.plantData,
  });
  final PlantsDetailsModel ? plantData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPlantDetailsNameAndTypeRow(plantData: plantData),
          const SizedBox(
            height: 12,
          ),
          Text(
            plantData?.description??"",
            style: Styles.textStyle12.copyWith(
                color: AppColors.greyColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 16,
          ),
          FittedBox(
            alignment: AlignmentDirectional.centerStart,
            fit: BoxFit.scaleDown,
            child: Text(
              "Scientific Name :  ${plantData?.scientificName??""}",
              style: Styles.textStyle12.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Other Name :  ${plantData?.otherName??""}",
            style: Styles.textStyle12.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            plantData?.dimension??"",
            style: Styles.textStyle12.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

