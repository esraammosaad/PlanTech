import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/on_boarding_controller.dart';
import 'package:grad_proj/data/data_source/static/static.dart';
import '../../widgets/on_boarding/custom_on_boarding_decoration.dart';
import '../../widgets/on_boarding/custom_on_boarding_image.dart';

class OnBoarding extends GetView<OnBoardingController> {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController());

    return Scaffold(
        body: PageView.builder(
          controller: controller.pageController,
            onPageChanged: (index){
            controller.swipePage(index);


            },
            itemCount: onBoardigList.length,
            itemBuilder: (context, i) =>  Stack(
                  children: [
                    CustomOnBoardingImage(index: i),
                     CustomOnBoardingDecoration(index : i),
                  ],
                )));
  }
}




