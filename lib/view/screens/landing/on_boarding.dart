import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/on_boarding_controller.dart';
import '../../../data/data_source/static/static_onboarding.dart';
import '../../widgets/on_boarding/custom_on_boarding_decoration.dart';

class OnBoarding extends GetView<OnBoardingController> {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController());

    return Scaffold(
        body: PageView.builder(
            controller: controller.pageController,
            onPageChanged: (index) {
              controller.swipePage(index);
            },
            itemCount: onBoardingList.length,
            itemBuilder: (context, i) => CustomOnBoardingDecoration(index: i)));
  }
}
