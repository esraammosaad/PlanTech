import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../../controller/on_boarding_controller.dart';
import '../../../data/data_source/static/static.dart';
class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
      builder: (controller)=>Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              onBoardigList.length,
                  (index) => AnimatedContainer(
                margin: const EdgeInsets.only(right: 10),
                duration: const Duration(microseconds: 900),
                width: controller.selectedPage==index?30:5,
                height: 5,
                decoration: ShapeDecoration(
                  color:   controller.selectedPage==index?null:const Color(0xFFE3E3E3),
                  gradient: controller.selectedPage==index? const LinearGradient(
                    begin: Alignment(1.00, -0.02),
                    end: Alignment(-1, 0.02),
                    colors: [Color(0xFF75E00A), Color(0xFF09E09F)],
                  ):null,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),)
          )
        ],
      ),
    );
  }
}
