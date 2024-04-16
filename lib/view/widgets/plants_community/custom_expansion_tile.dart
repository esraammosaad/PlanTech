import 'package:flutter/material.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/fonts.dart';
import '../../../core/constants/styles.dart';
import '../../../data/models/popular_questions_model.dart';
import '../home/custom_cached_network_image.dart';
class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({
    super.key, required this.questions, required this.isInitiallyExpanded,
  });
  final Questions questions;
  final bool isInitiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: isInitiallyExpanded,
        title: Text(
          questions
              .question ??
              '',
          style: Styles.textStyle18.copyWith(
              fontFamily: AppFonts.kArabicFont,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor:
        AppColors.backgroundColor,
        collapsedBackgroundColor:
        AppColors.backgroundColor,
        childrenPadding:
        const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),
        collapsedIconColor:
        AppColors.kPrimaryColor,
        iconColor: AppColors.kPrimaryColor,
        children: [
          Text(
            questions
                .answer ??
                '',
            style: Styles.textStyle14.copyWith(
                color: AppColors.greyColor,
                fontFamily: AppFonts.kArabicFont,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.justify,
          ),
          CustomCachedNetworkImage(
              image: questions
                  .defaultImage
                  ?.mediumUrl)
        ]);
  }
}
