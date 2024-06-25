import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/class/them_controller.dart';

import '../../../core/constants/styles.dart';

class CustomForgetPasswordButton extends StatelessWidget {
  const CustomForgetPasswordButton({
    super.key,
    required this.onPressed,
  });
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Align(
        alignment: Alignment.centerRight,
        child: TextButton(
            onPressed: onPressed,
            child: Text(
              '17'.tr,
              style: Styles.textStyle14(context).copyWith(
                  color: themeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black),
              textAlign: TextAlign.right,
            )));
  }
}
