import 'package:flutter/material.dart';
import 'package:grad_proj/core/constants/fonts.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/styles.dart';

class CustomAnimationBuilder extends StatelessWidget {
  const CustomAnimationBuilder({
    super.key,
    required this.animationController,
    required this.slidingAnimation,
  });

  final AnimationController animationController;
  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, _) => SlideTransition(
        position: slidingAnimation,
        child:  Text(
          'PlantHub',
          style: Styles.textStyle45.copyWith(color: AppColors.kPrimaryColor,fontFamily: AppFonts.kEnglishFont,fontWeight: FontWeight.w200),
        ),
      ),
    );
  }
}
