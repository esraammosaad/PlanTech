import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/styles.dart';
class CustomSliverTryAgainText extends StatelessWidget {
  const CustomSliverTryAgainText({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
        hasScrollBody: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
                  text,
                  style:
                  getValueForScreenType(context: context, mobile: Styles.textStyle14(context).copyWith(color: AppColors.kGreyColor),tablet: Styles.textStyle25(context).copyWith(color: AppColors.kGreyColor)),
                )),
            const SizedBox(height: 30,),
          ],
        ));
  }
}
