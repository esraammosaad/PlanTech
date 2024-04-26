import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:grad_proj/core/constants/styles.dart';
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
    title:  GetBuilder<ThemeController>(
      builder: (controller){
        return Text(
          text,style: Styles.textStyle18.copyWith(
            color: controller.isDarkMode.value ? Colors.white : Colors.black
        ),);},
    ),
    centerTitle: true,
  );
}