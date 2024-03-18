import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../constants/styles.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isLoading=false
  });
  final String text;
  final VoidCallback onTap;
   final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 45,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: ShapeDecoration(
          color: AppColors.kPrimaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        child: Center(
            child: isLoading? CircularProgressIndicator(color:Colors.white ,backgroundColor:AppColors.kPrimaryColor,):Text(text,
                style: Styles.textStyle17.copyWith(color: Colors.white))),
      ),
    );
  }
}
