import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/profile_controllers/edit_profile_controller.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/view/widgets/profile/custom_center_loading_indicator.dart';
import 'package:iconly/iconly.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/class/them_controller.dart';
import '../../../core/constants/fonts.dart';
import '../../../core/constants/styles.dart';

class CustomMyProfileStack extends StatelessWidget {
  const CustomMyProfileStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();

    return GetBuilder<EditProfileControllerImpl>(builder: (controller) {
      return controller.isLoading?Center(child: CircularProgressIndicator(color: AppColors.kPrimaryColor,),):Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomLeft,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                  height: getValueForScreenType(context: context, mobile: 130,tablet: 180),
                  width: double.infinity,
                  child: CachedNetworkImage(
                          imageUrl: controller.userData.header,
                          fit: BoxFit.cover,
                    width: double.infinity,
                        )),
              controller.isLoadingHeader
                  ? const CustomCenterLoadingIndicator()
                  : GestureDetector(
                      onTap: () async {
                        await controller.pickHeaderFromGallery();
                        await controller.updateUserHeader(context: context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(color: Colors.white70),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              IconlyLight.camera,
                              color: Colors.black,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Edit Header',
                              style: Styles.textStyle14(context)
                                  .copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    )
            ],
          ),
          Positioned(
            top: getValueForScreenType(context: context, mobile: 95,tablet: 115),
            left: 10,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: getValueForScreenType<double>(
                    context: context,
                    mobile: MediaQuery.sizeOf(context).width / 7.8,
                    tablet: 65,
                  ),
                  backgroundImage: CachedNetworkImageProvider(controller.userData.image ??
                      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'),
                ),
                const SizedBox(
                  width: 9,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: (MediaQuery.sizeOf(context).width / 7.8) / 1.5),
                  child: FittedBox(
                    alignment: AlignmentDirectional.centerStart,
                    fit: BoxFit.scaleDown,
                    child: Text(
                      FirebaseAuth.instance.currentUser!.displayName == ''
                          ? 'person'
                          : FirebaseAuth.instance.currentUser!.displayName ??
                              'person',
                      style: getValueForScreenType(
                          context: context,
                          mobile: Styles.textStyle25(context).copyWith(
                              color: themeController.isDarkMode.value
                                  ? Colors.white
                                  : Colors.grey[950],
                              fontFamily: AppFonts.kArabicFont),
                          tablet: Styles.textStyle36(context).copyWith(
                              color: themeController.isDarkMode.value
                                  ? Colors.white
                                  : Colors.grey[950],
                              fontFamily: AppFonts.kArabicFont,fontWeight: FontWeight.w300),),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}
