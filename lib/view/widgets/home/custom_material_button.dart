import 'package:flutter/material.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/styles.dart';
class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key, required this.text, required this.onPressed,
  });
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(onPressed: onPressed,
        color: AppColors.kPrimaryColor,
        padding: const EdgeInsets.all(9),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15) ,
            borderSide: BorderSide(color: AppColors.kPrimaryColor)
        ),child:  Text(
          text,
          style: Styles.textStyle16.copyWith(color: Colors.white,fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
