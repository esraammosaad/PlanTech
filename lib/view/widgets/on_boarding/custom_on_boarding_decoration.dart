import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/constants/color.dart';
import '../../../controller/on_boarding_controller.dart';
import '../../../core/constants/styles.dart';
import '../../../core/shared/custom_logo.dart';
import '../../../data/data_source/static/static_onboarding.dart';
import 'custom_on_boarding_button.dart';
import 'custom_shadow.dart';

class CustomOnBoardingDecoration extends GetView<OnBoardingController> {
  const CustomOnBoardingDecoration({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Image.asset(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            onBoardingList[index].image!,
          ),
          const CustomLogo(),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  onBoardingList[index].title!,
                  style: Styles.textStyle36(context)
                      .copyWith(color: Color(0xff5F6F52), height: 1),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  onBoardingList[index].body!,
                  style:
                      Styles.textStyle14(context).copyWith(color: Colors.black),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomOnBoardingButton(controller: controller),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
