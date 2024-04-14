import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:grad_proj/controller/home_controllers/nav_bar_controller.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:grad_proj/core/constants/color.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarControllerImp>(
      builder: (controller) => BottomBarCreative(
        enableShadow: true,
        items: const [
          TabItem(
            icon: Icons.home_rounded,
          ),
          TabItem(
            icon: Icons.groups,
          ),
          TabItem(
            icon: Icons.camera_alt_outlined,
          ),
          TabItem(
            icon: Icons.bluetooth,
          ),
          TabItem(
            icon: Icons.person_outline,
          ),
        ],
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15), topLeft: Radius.circular(15)),
        backgroundColor: const Color(0xffF4F4F4),
        iconSize: 25,
        color: AppColors.kGreyColor,
        colorSelected: AppColors.kPrimaryColor,
        indexSelected: controller.selectedPage,


        onTap: (int index) {
          controller.navBar(index);
          controller.pageController.jumpToPage(index);
        },
        isFloating: true,
      ),
    );
  }
}
