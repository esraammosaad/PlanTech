import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/constants/styles.dart';
class CustomSnapTipsBadPhoto extends StatelessWidget {
  const CustomSnapTipsBadPhoto({
    super.key,
    required this.image,
    required this.text,
  });
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    ThemeController themeController=Get.find();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: getValueForScreenType(context: context, mobile: 40,tablet: 100),
              backgroundImage: AssetImage(
                image,
              ),
            ),
             Positioned(
              top: -7,
              right: -7,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: getValueForScreenType(context: context, mobile: 15,tablet: 30),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: getValueForScreenType(context: context, mobile: 20,tablet: 40),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: getValueForScreenType(context: context, mobile: Styles.textStyle14(context).copyWith(color: themeController.isDarkMode.value?Colors.white:Colors.black,height: 0),tablet: Styles.textStyle25(context).copyWith(color: themeController.isDarkMode.value?Colors.white:Colors.black,height: 0)),
        )
      ],
    );
  }
}
