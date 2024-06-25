import 'package:flutter/material.dart';
import 'package:grad_proj/core/constants/color.dart';

showSnackBar(String message, BuildContext context) {
  SnackBar snackBar = SnackBar(

    content: Text(message),
    backgroundColor: AppColors.kGreyColor,
    margin: const EdgeInsets.all(16),
    shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: AppColors.kGreyColor)),
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
