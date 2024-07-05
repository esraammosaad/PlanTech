import 'package:flutter/material.dart';
import '../../../core/class/them_controller.dart';
import '../../../core/constants/styles.dart';

class CustomHeadingTwoText extends StatelessWidget {
  const CustomHeadingTwoText({
    super.key,
    required this.themeController,
    required this.text,
  });
  final String text;

  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Styles.textStyle16(context).copyWith(
          color: themeController.isDarkMode.value ? Colors.white : Colors.black,
          fontWeight: FontWeight.w100),
    );
  }
}
