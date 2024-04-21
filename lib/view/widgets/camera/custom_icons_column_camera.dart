import 'package:flutter/material.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/styles.dart';
class CustomIconsColumnCamera extends StatelessWidget {
  const CustomIconsColumnCamera({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: AppColors.kGreyColor,
            size: 28,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(text,
                style: Styles.textStyle14.copyWith(color: AppColors.kGreyColor)),
          )
        ],
      ),
    );
  }
}
