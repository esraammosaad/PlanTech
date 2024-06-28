import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/home_controllers/nav_bar_controller.dart';
import '../../../core/constants/app_routes.dart';
import 'custom_drawer_list_tile.dart';

class CustomDrawerListView extends StatefulWidget {
  const CustomDrawerListView({
    super.key,
  });

  @override
  State<CustomDrawerListView> createState() => _CustomDrawerListViewState();
}

class _CustomDrawerListViewState extends State<CustomDrawerListView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarControllerImp>(builder: (controller) {
      return SliverList.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: GestureDetector(
              onTap: () {
                controller.navBar(index);
                controller.pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut);
              },
              child: CustomDrawerListTile(
                item: controller.drawerList[index],
                selectedIndex: controller.selectedPage,
                index: index,
              )),
        ),
        itemCount: controller.drawerList.length,
      );
    });
  }
}
