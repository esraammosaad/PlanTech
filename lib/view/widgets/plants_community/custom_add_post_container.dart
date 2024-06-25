import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/class/them_controller.dart';
import '../../../core/constants/fonts.dart';
import '../../../core/constants/styles.dart';

class CustomAddPostContainer extends StatelessWidget {
  const CustomAddPostContainer({
    super.key,
    required this.hintText,
  });
  final String hintText;

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Obx(
       () {
        return Container(
          // height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: themeController.isDarkMode.value
                ? Colors.black26
                : Colors.grey[200],
            border: Border.all(
                color: themeController.isDarkMode.value
                    ? Colors.black12
                    : Colors.white54),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              hintText,
              style: getValueForScreenType(
                  context: context,
                  mobile: Styles.textStyle16(context).copyWith(
                      color: Colors.grey[400],
                      fontFamily: AppFonts.kArabicFont,
                      fontWeight: FontWeight.w600),
                  tablet: Styles.textStyle30(context).copyWith(
                      color: Colors.grey[400],
                      fontFamily: AppFonts.kArabicFont,
                      fontWeight: FontWeight.w600)),
            ),
          ),
        );
      }
    );
  }
}
