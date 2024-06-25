import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/styles.dart';

class CustomAddPostTextField extends StatelessWidget {
  const CustomAddPostTextField({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      controller: controller,

      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "What's on your mind?",
          hintStyle: getValueForScreenType(
              context: context,
              mobile: Styles.textStyle18(context)
                  .copyWith(color: AppColors.kGreyColor),
              tablet: Styles.textStyle30(context)
                  .copyWith(color: AppColors.kGreyColor))),
      minLines: 1,
      maxLines: 50,
      keyboardType: TextInputType.multiline,
    );
  }
}
