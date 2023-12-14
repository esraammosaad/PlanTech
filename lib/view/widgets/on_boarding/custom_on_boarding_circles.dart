import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:grad_proj/controller/on_boarding_controller.dart';
import 'package:grad_proj/core/constants/styles.dart';
import '../../../data/data_source/static/static.dart';
class CustomOnBoardingCircles extends StatelessWidget {
  const CustomOnBoardingCircles({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: GetBuilder<OnBoardingController>(
            builder: (controller)=>Container(
              width: MediaQuery.of(context).size.width * 0.40,
              height: MediaQuery.of(context).size.width * 0.40,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage(onBoardigList[index].image!),
                  fit: BoxFit.cover,
                ),
                shape: const OvalBorder(
                  side: BorderSide(width: 1.50, color: Colors.white),
                ),
              ),
              child: controller.selectedPage==3?null:Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.07,
                  height: MediaQuery.of(context).size.width * 0.07,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage(onBoardigList[index].image!),
                      fit: BoxFit.cover,
                    ),
                    shape: const OvalBorder(
                      side: BorderSide(width: 0.80, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.08,
          right: MediaQuery.of(context).size.width * 0.32,
          top: -12,
          child: Container(
            height: 48,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: Center(
              child: Text(
                onBoardigList[index].text!,
                style: Styles.textStyle18.copyWith(color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
