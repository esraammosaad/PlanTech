import 'package:flutter/material.dart';

import '../../../core/constants/color.dart';
class CustomCenterLoadingIndicator extends StatelessWidget {
  const CustomCenterLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          color: AppColors.kPrimaryColor,
        ),
      ),
    );
  }
}
