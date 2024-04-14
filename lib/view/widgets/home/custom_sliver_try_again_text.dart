import 'package:flutter/material.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/styles.dart';
class CustomSliverTryAgainText extends StatelessWidget {
  const CustomSliverTryAgainText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
            child: Text(
              'Please Try Again After While ......',
              style:
              Styles.textStyle14.copyWith(color: AppColors.kGreyColor),
            )));
  }
}
