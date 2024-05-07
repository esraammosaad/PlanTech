import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:grad_proj/controller/home_controllers/profile_controller.dart';
import 'package:grad_proj/view/widgets/profile/custom_profile_column.dart';
import 'package:iconly/iconly.dart';
import '../../../core/constants/color.dart';
class CustomEditPhotoWidget extends StatelessWidget {
  const CustomEditPhotoWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileControllerImpl>(
      builder: (controller) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomRight,
          children: [
            controller.image!=null? CircleAvatar(
              radius: 45,
              backgroundImage: FileImage(controller.image!),
            ): CircleAvatar(
          radius: 45,
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
                        radius: 16,
                        backgroundColor: AppColors.kPrimaryColor,
                        child: Icon(
                          IconlyLight.camera,
                          color: AppColors.backgroundColor,
                          size: 20,
                        )),
                  )),

          ],
        );
      }
    );
  }
}
