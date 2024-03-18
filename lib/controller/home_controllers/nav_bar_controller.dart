import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class NavBarController extends GetxController{

  navBar(int index);

}

class NavBarControllerImp extends NavBarController{
  late PageController pageController;

  int selectedPage = 0;

  @override
  navBar(int index) {
    selectedPage = index;
    update();
  }
  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }


}