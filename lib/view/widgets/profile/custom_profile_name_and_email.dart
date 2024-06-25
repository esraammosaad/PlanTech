import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/profile_controllers/edit_profile_controller.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/constants/fonts.dart';
import '../../../core/constants/styles.dart';

class CustomProfileNameAndEmail extends StatelessWidget {
  const CustomProfileNameAndEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return GetBuilder<EditProfileControllerImpl>(builder: (controller) {
      return controller.isLoading
          ? const CustomProfileLoadingShimmer()
          : Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    alignment: AlignmentDirectional.centerStart,
                    fit: BoxFit.scaleDown,
                    child: Text(
                      FirebaseAuth.instance.currentUser!.displayName == ''
                          ? 'person'
                          : FirebaseAuth.instance.currentUser!.displayName??'person',
                      style: getValueForScreenType(context: context, mobile: Styles.textStyle25(context).copyWith(
                          color: themeController.isDarkMode.value
                              ? Colors.white
                              : Colors.grey[950],
                          fontFamily: AppFonts.kArabicFont),tablet: Styles.textStyle30(context).copyWith(
                          color: themeController.isDarkMode.value
                              ? Colors.white
                              : Colors.grey[950],
                          fontFamily: AppFonts.kArabicFont)),
                    ),
                  ),
                  FittedBox(
                    alignment: AlignmentDirectional.centerStart,
                    fit: BoxFit.scaleDown,
                    child: Text(
                      FirebaseAuth.instance.currentUser!.email == ''
                          ? 'person'
                          : FirebaseAuth.instance.currentUser!.email??'person',
                      style: getValueForScreenType(context: context, mobile: Styles.textStyle16(context).copyWith(
                          color: themeController.isDarkMode.value
                              ? Colors.white70
                              : Colors.grey[600],
                          fontFamily: AppFonts.kPrimaryFont,
                          fontWeight: FontWeight.w300),tablet: Styles.textStyle18(context).copyWith(
                          color: themeController.isDarkMode.value
                              ? Colors.white70
                              : Colors.grey[600],
                          fontFamily: AppFonts.kPrimaryFont,
                          fontWeight: FontWeight.w300)),
                    ),
                  ),
                ],
              );
            });
    });
  }
}

class CustomProfileLoadingShimmer extends StatelessWidget {
  const CustomProfileLoadingShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

                 Container(
                  height: 22,
                  width: 150,
                  color: Colors.white,
                ),
              const SizedBox(height: 5,),
              Container(
                  height: 20,
                  width: double.infinity,
                  color: Colors.white,
                ),

            ],
          ),
        ),
      );
  }
}
