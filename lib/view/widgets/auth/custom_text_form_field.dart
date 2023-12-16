import 'package:flutter/material.dart';
import 'package:grad_proj/core/constants/color.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.onSave,
    required this.keyboardType,
    required this.textInputAction,
    required this.obscureText,
    this.controller,
    required this.errMassage,
  }) : super(key: key);

  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final void Function(String?) onSave;
  final TextEditingController? controller;
  final String errMassage;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: AppColors.textFormColor,
      onSaved: onSave,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: (value) {
        if (value!.isEmpty) {
          return errMassage;
        }
        return null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(
          color: AppColors.textFormColor,
        ),
        contentPadding: const EdgeInsets.only(
          top: 16,
          bottom: 16,
          left: 25,
        ),
        border: buildOutlineInputBorder(AppColors.textFormColor),
        errorBorder: buildOutlineInputBorder(AppColors.kPrimaryColor),
        focusedErrorBorder: buildOutlineInputBorder(Colors.red),
        focusedBorder: buildOutlineInputBorder(AppColors.textFormColor),
        enabledBorder: buildOutlineInputBorder(AppColors.textFormColor),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
