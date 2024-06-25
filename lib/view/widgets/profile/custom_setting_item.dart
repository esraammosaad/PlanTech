import 'package:flutter/material.dart';
import 'package:grad_proj/core/constants/color.dart';

class CustomSettingItem extends StatelessWidget {
  const CustomSettingItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: AppColors.greyColor,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: TextStyle(color: AppColors.kGreyColor),
                ),
              ],
            ),
            IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.kGreyColor,
                ))
          ],
        ),
      ],
    );
  }
}
