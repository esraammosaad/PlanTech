import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../controller/community_controllers/plants_community_controller.dart';
import '../../../core/class/them_controller.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/styles.dart';
import '../home/custom_profile_avatar.dart';

class CustomAddPostHeader extends StatelessWidget {
  const CustomAddPostHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return GetBuilder<PlantsCommunityControllerImp>(builder: (controller) {
      return Row(
        children: [
          SizedBox(
              width: getValueForScreenType(
                  context: context, mobile: 40, tablet: 120),
              height: getValueForScreenType(
                  context: context, mobile: 40, tablet: 120),
              child: CustomProfileAvatar(
                image: FirebaseAuth.instance.currentUser?.photoURL ??
                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
              )),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                FirebaseAuth.instance.currentUser?.displayName ?? "person",
                style:getValueForScreenType(context: context, mobile:  Styles.textStyle14(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: themeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black,
                ),tablet:  Styles.textStyle30(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: themeController.isDarkMode.value
                      ? Colors.white
                      : Colors.black,
                )),
              ),
              Text(
                'public',
                style: getValueForScreenType(context: context, mobile: Styles.textStyle12(context)
                    .copyWith(color: AppColors.greyColor),tablet: Styles.textStyle20(context)
                    .copyWith(color: AppColors.greyColor)),
              ),
            ],
          )
        ],
      );
    });
  }
}
