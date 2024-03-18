import 'package:flutter/material.dart';
import 'package:grad_proj/controller/home_controllers/home_controller.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:get/get.dart';
import '../../../data/data_source/static/static_onboarding.dart';
class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller)=>Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              onBoardingList.length,
                  (index) => AnimatedContainer(
                margin: const EdgeInsets.only(right: 10),
                duration: const Duration(microseconds: 900),
                width: controller.currentIndex==index?20:5,
                height: 5,
                decoration: ShapeDecoration(
                  color:   controller.currentIndex==index?AppColors.kPrimaryColor:const Color(0xFFE3E3E3),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),)
          )
        ],
      ),
    );
  }
}
