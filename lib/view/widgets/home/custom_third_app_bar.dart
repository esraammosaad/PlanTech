import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/color.dart';

PreferredSizeWidget customAppBar({required String text}){

  return AppBar(
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        size: 25,
        color: AppColors.kPrimaryColor,
      ),
      onPressed: () {
        Get.back();
      },
    ),
    title:  Text(text),
    centerTitle: true,
  );
}