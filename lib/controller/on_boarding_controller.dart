import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grad_proj/view/screens/login.dart';

class OnBoardingController extends GetxController {
  PageController pageController = PageController();
  int selectedPage = 0;

  nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInExpo);


    if (selectedPage < 3) {
      selectedPage++;
    }else{
      Get.to(()=>const LogIn(),transition: Transition.cupertino);
    }
    update();
  }

  swipePage(int index){
    selectedPage=index;
    update();
  }
}
