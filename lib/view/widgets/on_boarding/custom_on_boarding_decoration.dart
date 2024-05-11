import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [

        Image.asset(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
          onBoardingList[index].image!,
        ),
        const CustomShadow(),
        const CustomLogo(),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                onBoardingList[index].title!,
                style:
                    Styles.textStyle36(context).copyWith(color: Colors.white, height: 1),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                onBoardingList[index].body!,
                style: Styles.textStyle14(context).copyWith(color: Colors.white),
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
    );
  }
}





