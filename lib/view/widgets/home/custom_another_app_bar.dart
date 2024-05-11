import 'package:flutter/material.dart';
import 'package:grad_proj/controller/home_controllers/nav_bar_controller.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/styles.dart';

class CustomAnotherAppBar extends StatelessWidget {
  const CustomAnotherAppBar({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    NavBarControllerImp controller = Get.find();
    ThemeController themeController = Get.find();
    return Obx(() {
      return Row(
        children: [
          // IconButton(
          //   icon: Icon(
          //     Icons.arrow_back,
          //     size: getValueForScreenType(context: context, mobile: 25,tablet: 40),
          //     color: AppColors.kPrimaryColor,
          //   ),
          //   onPressed: () {
          //     controller.pageController.jumpToPage(controller.selectedPage - 1);
          //     FocusScope.of(context).unfocus();
          //   },
          // ),
          const SizedBox(
            width: 20,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: getValueForScreenType(context: context, mobile: Styles.textStyle20(context).copyWith(
                color: themeController.isDarkMode.value
                    ? Colors.white70
                    : Colors.black,
                fontWeight: FontWeight.bold),tablet: Styles.textStyle25(context).copyWith(
                color: themeController.isDarkMode.value
                    ? Colors.white70
                    : Colors.black,
                fontWeight: FontWeight.bold)),
          ),
        ],
      );
    });
  }
}
