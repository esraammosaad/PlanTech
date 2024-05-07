import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import '../../../core/constants/styles.dart';
class CustomTextRich extends StatelessWidget {
  const CustomTextRich({
    super.key,
    required this.text,
    required this.textTwo,
    required this.onTap,
  });
  final String text;
  final String textTwo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    ThemeController themeController=Get.find();
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: text,
              style: Styles.textStyle14(context).copyWith(color: themeController.isDarkMode.value
                  ? Colors.white
                  : Colors.black),
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap=onTap,
              text: textTwo,
              style: Styles.textStyle16(context),
            ),
          ],
        ),
      ),
    );
  }
}
