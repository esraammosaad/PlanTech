import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/styles.dart';
class CustomForgetPasswordButton extends StatelessWidget {
  const CustomForgetPasswordButton({
    super.key,
    required this.onPressed,
  });
 final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: TextButton(
            onPressed: onPressed,
            child:  Text(
              '17'.tr,
              style: Styles.textStyle14,
              textAlign: TextAlign.right,
            )));
  }
}