import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/constants/app_routes.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/fonts.dart';
import '../../../core/constants/image_asset.dart';
import '../../../core/constants/styles.dart';
import '../../../data/models/popular_questions_model.dart';

class CustomPopularQuestionsListItem extends StatelessWidget {
  const CustomPopularQuestionsListItem({
    super.key,
    required this.question,
  });
  final Questions question;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.popularQuestionsScreen,arguments: [question]);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          image: const DecorationImage(image: AssetImage(AppImageAsset.cardBg)),
          color: AppColors.kPrimaryColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.kPrimaryColor),
        ),
        child: Text(
          question.question ?? "",
          style: Styles.textStyle18(context).copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontFamily: AppFonts.kArabicFont,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),
      ),
    );
  }
}
