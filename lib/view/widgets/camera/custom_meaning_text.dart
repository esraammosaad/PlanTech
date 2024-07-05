import 'package:flutter/material.dart';
import '../../../core/class/them_controller.dart';
import '../../../core/constants/styles.dart';

class CustomMeaningText extends StatelessWidget {
  const CustomMeaningText({
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
      style: Styles.textStyle13(context).copyWith(
          color: themeController.isDarkMode.value ? Colors.white70 : Colors.black,
          height: 1.2),
      textAlign: TextAlign.left,
    );
  }
}
