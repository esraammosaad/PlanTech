import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
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
            size:
                getValueForScreenType(context: context, mobile: 28, tablet: 56),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              style: getValueForScreenType(
                  context: context,
                  mobile: Styles.textStyle14(context)
                      .copyWith(color: AppColors.kGreyColor),
                  tablet: Styles.textStyle25(context)
                      .copyWith(color: AppColors.kGreyColor)),
            ),
          )
        ],
      ),
    );
  }
}
