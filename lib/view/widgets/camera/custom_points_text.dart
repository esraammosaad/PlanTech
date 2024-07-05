import 'package:flutter/material.dart';
import '../../../core/class/them_controller.dart';
import '../../../core/constants/styles.dart';
class CustomPointsText extends StatelessWidget {
  const CustomPointsText({
    super.key,
    required this.themeController,
    required this.text,
  });

  final ThemeController themeController;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      alignment: Alignment.topLeft,
      fit: BoxFit.contain,
      child: Text(
        text,
        style: Styles.textStyle14(context).copyWith(
          color: themeController.isDarkMode.value
              ? Colors.grey[400]
              : Colors.black,
          fontWeight: FontWeight.w100,
        ),
      ),
    );
  }
}
