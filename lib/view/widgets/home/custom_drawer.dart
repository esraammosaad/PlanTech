import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:grad_proj/core/constants/app_routes.dart';
import 'package:iconly/iconly.dart';
import '../../../controller/profile_controllers/edit_profile_controller.dart';
import '../../../core/constants/color.dart';
import '../../../data/models/drawer_model.dart';
import 'active_and_inactive_list_tile.dart';
import 'custom_drawer_list_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController themeController=Get.find();
    return Obx(
      () {
        return Container(
          color: themeController.isDarkMode.value?Colors.black38:AppColors.backgroundColor,
          child:   CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 20,),),
              const CustomDrawerListView(),
              SliverFillRemaining(
                hasScrollBody: false,
                fillOverscroll: false,
                child: Column(
                  children: [
                    const Expanded(child: SizedBox()),
                    const SizedBox(
                      height: 20,
                    ),


                    GestureDetector(
                      onTap: (){
                        Get.toNamed(AppRoutes.cameraScreen);
                      },
                      child: const InActiveListTile(
                          item: DrawerModel(
                              title: 'Camera', icon: IconlyLight.camera)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GetBuilder<EditProfileControllerImpl>(
                      builder: (controller) {
                        return GestureDetector(
                          onTap: () async {
                            await controller.logOut();
                          },
                          child: const InActiveListTile(
                              item: DrawerModel(
                                  title: 'Logout account', icon: Icons.login_sharp)),
                        );
                      }
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
