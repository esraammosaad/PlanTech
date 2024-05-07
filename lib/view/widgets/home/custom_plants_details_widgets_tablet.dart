import 'package:flutter/material.dart';
import 'package:grad_proj/data/models/plants_details_model.dart';
import 'custom_plant_details_name_and_type_row.dart';

class CustomPlantsDetailsWidgetsTablet extends StatelessWidget {
  const CustomPlantsDetailsWidgetsTablet({
    super.key,
    required this.plantData,
  });
  final PlantsDetailsModel? plantData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPlantDetailsNameAndTypeRow(plantData: plantData),
            const SizedBox(
              height: 20,
            ),

          ],
        )
    );
  }
}
