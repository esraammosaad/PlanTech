import 'package:flutter/material.dart';
import 'package:grad_proj/controller/home_controllers/nav_bar_controller.dart';
import 'package:grad_proj/view/screens/camera/my_garden.dart';
import 'package:grad_proj/view/screens/home/home.dart';
import 'package:grad_proj/view/screens/home/profile.dart';
import 'package:get/get.dart';
import '../../../core/functions/alert_dialog.dart';
import '../../widgets/home/custom_nav_bar.dart';
import '../community/plants_community.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isVisible=MediaQuery.of(context).viewInsets.bottom!=0;
    NavBarControllerImp controller = Get.find();
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,

      body: PopScope(
        canPop: false,
        onPopInvoked: (p) => alertExitApp(),
        child: PageView(
          controller: controller.pageController,
          onPageChanged: (index) {
            controller.navBar(index);
          },
          children:  [
            Home(),
            PlantsCommunity(),
            Bluetooth(),
            Profile(),
          ],
        ),
      ),
      floatingActionButton:  Visibility(
        visible: !isVisible,

          child: const CustomFloatingButton()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}

