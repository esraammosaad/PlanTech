import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:grad_proj/controller/profile_controllers/edit_profile_controller.dart';
import 'package:iconly/iconly.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/constants/color.dart';
import 'custom_center_loading_indicator.dart';
class CustomEditPhotoWidget extends StatelessWidget {
  const CustomEditPhotoWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileControllerImpl>(
      builder: (controller) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomRight,
          children: [
            controller.image!=null? CircleAvatar(
              radius: getValueForScreenType(context: context, mobile: 45,tablet: 100),
              backgroundImage: FileImage(controller.image!),
            ): CircleAvatar(
          radius: getValueForScreenType(context: context, mobile: 45,tablet: 100),
          backgroundImage:NetworkImage(controller.userData.image ),
        ),

             Positioned(
                  right: -5,
                  bottom: -5,
                  child: GestureDetector(
                    onTap: () async {
                     await controller.pickImageFromGallery();
                     await controller.updateUserPhoto(context: context);

                    },
                    child:controller.isLoadingPhoto?const CustomCenterLoadingIndicator(): CircleAvatar(
                        radius: getValueForScreenType(context: context, mobile: 16,tablet: 32),
                        backgroundColor: AppColors.kPrimaryColor,
                        child: Icon(
                          IconlyLight.camera,
                          color: AppColors.backgroundColor,
                          size: getValueForScreenType(context: context, mobile: 20,tablet: 38),
                        )),
                  )),

          ],
        );
      }
    );
  }
}
