import 'package:flutter/material.dart';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              plantData?.commonName??'',
              style: Styles.textStyle18,

            ),
          ),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: AlignmentDirectional.centerStart,
          child: Text(" Type ${plantData?.type??''}",
              style: Styles.textStyle12.copyWith(
                fontWeight: FontWeight.w300,
              )),
        ),
      ],
    );
  }
}
