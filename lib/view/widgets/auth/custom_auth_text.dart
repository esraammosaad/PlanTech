import 'package:flutter/material.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/styles.dart';
class CustomAuthText extends StatelessWidget {
  const CustomAuthText({
    super.key,
    required this.text, required this.subText,
  });
  final String text;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(text, style: Styles.textStyle30.copyWith(color: AppColors.kPrimaryColor,fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 7,
        ),
        Text(
            subText,
            style: Styles.textStyle12.copyWith(color:AppColors.greyColor,height: 1.5)),
      ],
    );
  }
}
