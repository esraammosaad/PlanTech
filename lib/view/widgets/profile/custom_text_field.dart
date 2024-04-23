import 'package:flutter/material.dart';
import 'package:grad_proj/core/constants/styles.dart';
import '../../../core/constants/color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
    required this.controller, required this.widget,

  });
  final String text;
  final Widget widget;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextField(
          style: Styles.textStyle14,
          cursorColor: AppColors.kPrimaryColor,
          controller: controller,
          decoration: InputDecoration(
              hintText: text,
              hintStyle: Styles.textStyle14,
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.kPrimaryColor)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.kPrimaryColor))),
        ),
        widget,
      ],
    );
  }
}

class CustomConfirmEditProfileButton extends StatelessWidget {
  const CustomConfirmEditProfileButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.kPrimaryColor),
        ),
        child: Center(
            child: Text(
          'Confirm',
          style: Styles.textStyle10,
        )),
      ),
    );
  }
}
