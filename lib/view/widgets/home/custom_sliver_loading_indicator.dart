import 'package:flutter/material.dart';
import '../../../core/constants/color.dart';

class CustomSliverLoadingIndicator extends StatelessWidget {
  const CustomSliverLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
        child: Center(
            child: CircularProgressIndicator(
      color: AppColors.kPrimaryColor,
    )));
  }
}
