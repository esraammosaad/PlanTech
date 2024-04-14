import 'package:flutter/material.dart';
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
          hintStyle: Styles.textStyle18.copyWith(color: AppColors.kGreyColor)),
      minLines: 1,
      maxLines: 10,
      keyboardType: TextInputType.multiline,
    );
  }
}
