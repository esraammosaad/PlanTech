import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../data/models/drawer_model.dart';

abstract class NavBarController extends GetxController{

  navBar(int index);

}

class NavBarControllerImp extends NavBarController{
  late PageController pageController;

  int selectedPage = 0;
  List<DrawerModel> drawerList =  [
    const DrawerModel(title: 'Home', icon:IconlyLight.home),
    const DrawerModel(title: 'Plants Community', icon: IconlyLight.user_1),
    const DrawerModel(title: 'My Garden', icon: Icons.yard_outlined),
    const DrawerModel(title: 'Settings', icon: IconlyLight.setting),
  ];

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