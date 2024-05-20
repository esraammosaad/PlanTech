import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/home_controllers/home_controller.dart';
import 'package:grad_proj/controller/profile_controllers/edit_profile_controller.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:grad_proj/core/constants/app_routes.dart';
import 'package:grad_proj/view/widgets/profile/custom_center_loading_indicator.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/constants/fonts.dart';
import '../../../core/constants/styles.dart';
import 'custom_profile_avatar.dart';
import 'custom_search_icon.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return Obx(() {
      return Row(
        children: [
          GestureDetector(
            onTap: (){
              Get.toNamed(AppRoutes.myProfileScreen);
            },
            child: GetBuilder<EditProfileControllerImpl>(
              builder: (controller) {
                return controller.isLoading?const CustomCenterLoadingIndicator(): CustomProfileAvatar(
                    image: controller.userData.image ??
                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png');
              }
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back!',
                style: getValueForScreenType(context: context, mobile: Styles.textStyle16(context).copyWith(
                    fontWeight: FontWeight.w300,
                    color: themeController.isDarkMode.value
                        ? Colors.white
                        : Colors.grey[600],
                    fontFamily: AppFonts.kArabicFont),tablet: Styles.textStyle25(context).copyWith(
                    fontWeight: FontWeight.w300,
                    color: themeController.isDarkMode.value
                        ? Colors.white
                        : Colors.grey[600],
                    fontFamily: AppFonts.kArabicFont)),
              ),
              Text(
                FirebaseAuth.instance.currentUser?.displayName == '' ||
                        FirebaseAuth.instance.currentUser?.displayName == null
                    ? 'person'
                    : FirebaseAuth.instance.currentUser!.displayName!,
                style: getValueForScreenType(context: context, mobile: Styles.textStyle16(context).copyWith(
                    fontWeight: FontWeight.w500,
                    color: themeController.isDarkMode.value
                        ? Colors.grey
                        : Colors.black,
                    fontFamily: AppFonts.kArabicFont),tablet: Styles.textStyle25(context).copyWith(
                    fontWeight: FontWeight.w500,
                    color: themeController.isDarkMode.value
                        ? Colors.grey
                        : Colors.black,
                    fontFamily: AppFonts.kArabicFont)),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(onTap:(){
            Get.toNamed(AppRoutes.searchHomeScreen);
            HomeControllerImp homeController=Get.find();
            homeController.searchController.clear();
            homeController.searchResult.clear();
          },child: const CustomSearchIcon()),
        ],
      );
    });
  }
}
