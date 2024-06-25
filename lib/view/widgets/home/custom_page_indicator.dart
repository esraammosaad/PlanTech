import 'package:flutter/material.dart';
import 'package:grad_proj/controller/home_controllers/home_controller.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:get/get.dart';
import '../../../data/data_source/static/static_onboarding.dart';
class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeController themeController=Get.find();
    return GetBuilder<HomeControllerImp>(
      builder: (controller)=>Obx(
        () {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                  onBoardingList.length,
                      (index) => AnimatedContainer(
                    margin: const EdgeInsets.only(right: 10),
                    duration: const Duration(microseconds: 900),
                    width: controller.currentIndex==index?25:10,
                    height: 6,
                    decoration: ShapeDecoration(
                      color:   controller.currentIndex==index?AppColors.kPrimaryColor:themeController.isDarkMode.value?Colors.white12:const Color(0xFFE3E3E3),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),)
              )
            ],
          );
        }
      ),
    );
  }
}
