import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/styles.dart';

PreferredSizeWidget customEditAndAddPostAppBar(BuildContext context,
    {required String text}) {
  return AppBar(
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        size: getValueForScreenType(context: context, mobile: 25, tablet: 40),
        color: AppColors.kPrimaryColor,
      ),
      onPressed: () {
        Get.back();
      },
    ),
    actions: [
      TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: getValueForScreenType(
              context: context,
              mobile: Styles.textStyle16(context),
              tablet: Styles.textStyle30(context).copyWith(
                  color: AppColors.kPrimaryColor, fontWeight: FontWeight.bold)),
        ),
      ),
    ],
  );
}
