import 'package:flutter/material.dart';
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
    return Container(
      margin: const EdgeInsets.only(right: 5),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
      child: FittedBox(
          alignment: Alignment.center,
          fit: BoxFit.scaleDown,
          child: Text(
            originList?[index] ?? "",
            style: Styles.textStyle12.copyWith(color: AppColors.kPrimaryColor),
          )),
    );
  }
}
