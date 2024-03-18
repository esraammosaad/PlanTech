import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/core/constants/styles.dart';
import 'package:get/get.dart';

alertExitApp() {
  Get.defaultDialog(
      title: "Alert",
      middleText: 'Do you want to close app',
      actions: [
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: Text(
              'confirm',
              style:
                  Styles.textStyle14.copyWith(color: AppColors.kPrimaryColor),
            )),
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              'cancel',
              style:
                  Styles.textStyle14.copyWith(color: AppColors.kPrimaryColor),
            )),
      ]);
}
