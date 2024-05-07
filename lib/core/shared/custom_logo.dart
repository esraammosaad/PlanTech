import 'package:flutter/material.dart';
import '../constants/color.dart';
import '../constants/fonts.dart';
import '../constants/styles.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'PlantHub',
            style: Styles.textStyle18(context).copyWith(
                color: AppColors.kPrimaryColor,
                fontFamily: AppFonts.kEnglishFont,
                fontWeight: FontWeight.w200),
          ),
        ),
      ),
    );
  }
}
