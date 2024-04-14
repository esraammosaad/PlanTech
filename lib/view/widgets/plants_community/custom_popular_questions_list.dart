import 'package:flutter/material.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/core/constants/image_asset.dart';
import 'package:grad_proj/core/constants/styles.dart';

class CustomPopularQuestionsList extends StatelessWidget {
  const CustomPopularQuestionsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemBuilder: (context, index) => AspectRatio(
          aspectRatio: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage(AppImageAsset.cardBg)),
              color: AppColors.kPrimaryColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.kPrimaryColor),
            ),
            child: Text(
              'Why does the whole plant die?',
              style: Styles.textStyle18.copyWith(color: Colors.white),
            ),
          ),
        ),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
