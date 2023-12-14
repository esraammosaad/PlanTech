import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  PageController pageController = PageController();
  int selectedPage = 0;

  nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInExpo);


    if (selectedPage < 2) {
      selectedPage++;
    }
    update();
  }

  swipePage(int index){
    selectedPage=index;
    update();
  }
}
