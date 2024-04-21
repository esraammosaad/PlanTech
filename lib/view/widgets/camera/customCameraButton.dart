import 'package:flutter/material.dart';
import '../../../core/constants/color.dart';
class CustomCameraButton extends StatelessWidget {
  const CustomCameraButton({
    super.key, required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: AppColors.kPrimaryColor,
        radius: 35,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 29,
          child: CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
