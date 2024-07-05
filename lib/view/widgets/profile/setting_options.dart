import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/constants/app_routes.dart';
import 'package:grad_proj/view/screens/language/choose_language.dart';
import 'package:iconly/iconly.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../controller/profile_controllers/edit_profile_controller.dart';
import '../../../core/constants/color.dart';
import 'custom_change_mode_switch.dart';
import 'custom_setting_item.dart';
import 'custom_space.dart';

class SettingOptions extends StatelessWidget {
  const SettingOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileControllerImpl>(builder: (controller) {
      return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(CupertinoIcons.moon_stars,
                          color: AppColors.greyColor),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Dark Mode",
                        style: TextStyle(color: AppColors.greyColor),
                      ),
                    ],
                  ),
                  const CustomChangeModeSwitch(),
                ],
              ),
              const CustomSpace(),
              CustomSettingItem(
                icon: IconlyLight.profile,
                title: "Your Profile",
                onPressed: () {

                  Get.toNamed(AppRoutes.myProfileScreen);

                },
              ),
              const CustomSpace(),
              CustomSettingItem(
                icon: IconlyLight.edit,
                title: "Edit Profile",
                onPressed: () {
                  Get.toNamed(AppRoutes.editProfileScreen);
                },
              ),
              const CustomSpace(),
              CustomSettingItem(
                icon: Icons.bluetooth_connected,
                title: "Connect Your Camera",
                onPressed: () {
                  Get.toNamed(AppRoutes.connectCameraScreen);
                },
              ),   const CustomSpace(),
              // CustomSettingItem(
              //   icon: Icons.stream,
              //   title: "Image Stream",
              //   onPressed: () {
              //     Get.toNamed(AppRoutes.imageStreamingScreen);
              //   },
              // ),
              // const CustomSpace(),
              // CustomSettingItem(
              //   icon: Icons.live_tv_outlined,
              //   title: "Live Stream",
              //   onPressed: () {
              //     Get.toNamed(AppRoutes.liveStreamingScreen);
              //   },
              // ),
              // const CustomSpace(),
              CustomSettingItem(
                icon: IconlyLight.notification,
                title: "Notifications",
                onPressed: () {
                  Get.toNamed(AppRoutes.notificationsScreen);
                },
              ),
              const CustomSpace(),
              CustomSettingItem(
                icon: Icons.language,
                title: "Language",
                onPressed: () {
                  Get.to(const ChooseLanguage());
                },
              ),
              const CustomSpace(),
              CustomSettingItem(
                icon: IconlyLight.info_circle,
                title: "Info",
                onPressed: () {
                  Get.toNamed(AppRoutes.infoScreen);
                },
              ),
              const CustomSpace(),
              CustomSettingItem(
                icon: IconlyLight.calling,
                title: "Contact Us",
                onPressed: () {
                  Get.toNamed(AppRoutes.contactUsScreen);

                },
              ),
              getValueForScreenType(
                  context: context,
                  mobile: Column(
                    children: [
                      const CustomSpace(),
                      CustomSettingItem(
                        icon: IconlyLight.logout,
                        title: "Logout",
                        onPressed: () {
                          controller.logOut();
                        },
                      ),
                    ],
                  ),
                  tablet: const SizedBox()),
            ],
          ),
        ),
      );
    });
  }
}
