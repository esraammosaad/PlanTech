import 'package:flutter/material.dart';
import 'package:grad_proj/controller/home_controllers/nav_bar_controller.dart';
import 'package:grad_proj/view/screens/home/camera.dart';
import 'package:grad_proj/view/screens/home/add_post.dart';
import 'package:grad_proj/view/screens/home/plants_community.dart';
import 'package:grad_proj/view/screens/home/home.dart';
import 'package:grad_proj/view/screens/home/profile.dart';
import 'package:get/get.dart';

import '../../../core/functions/alert_dialog.dart';
import '../../widgets/home/custom_nav_bar.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavBarControllerImp controller = Get.find();
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: (p) => alertExitApp(),
        child: PageView(
          controller: controller.pageController,
          onPageChanged: (index) {
            controller.navBar(index);
          },
          children: const [
            Home(),
            PlantsCommunity(),
            Camera(),
            AddPost(),
            Profile(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
