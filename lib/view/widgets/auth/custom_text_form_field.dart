import 'package:flutter/material.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.onSave,
    required this.keyboardType,
    required this.textInputAction,
    required this.obscureText,
    this.controller,
    required this.errMassage, this.icon, this.prefixIcon, this.validator, required this.hintText,
  }) : super(key: key);

  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final void Function(String?) onSave;
  final TextEditingController? controller;
  final String errMassage;
  final Widget?  icon;
  final Widget?  prefixIcon;
  final  String ? Function(String?)? validator;
  final String hintText;



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: AppColors.kPrimaryColor,
      onSaved: onSave,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator??(value) {
        if (value!.isEmpty) {
          return errMassage;
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon:icon ,
        // floatingLabelAlignment:FloatingLabelAlignment.start ,
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        // labelText:'email' ,
        // labelStyle: Styles.textStyle20,
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.greyColor),

        contentPadding: const EdgeInsets.only(
          top: 16,
          bottom: 16,
          left: 25,
        ),
        border: buildOutlineInputBorder(AppColors.greyColor),
        errorBorder: buildOutlineInputBorder(Colors.red),
        focusedErrorBorder: buildOutlineInputBorder(Colors.red),
        focusedBorder: buildOutlineInputBorder(AppColors.greyColor),
        enabledBorder: buildOutlineInputBorder(AppColors.greyColor),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color,width: 0.5),
      borderRadius: BorderRadius.circular(15),
    );
  }
}
