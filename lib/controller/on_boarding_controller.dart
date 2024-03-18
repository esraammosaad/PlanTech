import 'package:flutter/cupertino.dart';
import 'package:grad_proj/core/constants/app_routes.dart';
import 'package:grad_proj/core/services/services.dart';
import 'package:get/get.dart';


class OnBoardingController extends GetxController {
  PageController pageController = PageController();
  int selectedPage = 0;
  MyServices myServices = Get.find();

  nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInExpo);

    if (selectedPage < 2) {
      selectedPage++;
    } else {
      myServices.sharedPreferences.setString('onBoardingSeen', '1');
      Get.offAllNamed(AppRoutes.logInScreen);
    }
    update();
  }

  swipePage(int index) {
    selectedPage = index;
    update();
  }
}
