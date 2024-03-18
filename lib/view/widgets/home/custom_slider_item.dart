import 'package:flutter/material.dart';
import 'package:grad_proj/core/constants/color.dart';
import '../../../core/constants/fonts.dart';
import '../../../core/constants/styles.dart';
import '../../../data/models/onboardingmodel.dart';

class CustomSliderItem extends StatelessWidget {
  const CustomSliderItem({
    super.key, required this.item,
  });
  final OnBoardingModel item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin:
          const EdgeInsets.symmetric(vertical: 8),
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width,
          decoration:  BoxDecoration(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(25),bottomRight:Radius.circular(25) ),
            color: AppColors.kPrimaryColor,
            // image: DecorationImage(
            //   image: AssetImage(item.image!),fit: BoxFit.cover,
            // ),
          ),
        ),
        Positioned(
          right: 0,
          left: 10,
          top: 30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title!,
                style: Styles.textStyle20
                    .copyWith(color: Colors.white,fontFamily: AppFonts.kArabicFont,fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5,),
              Text(
                item.body!,
                style: Styles.textStyle14
                    .copyWith(color: Colors.grey[350],fontFamily: AppFonts.kArabicFont,fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
