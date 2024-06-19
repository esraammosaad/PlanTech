import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/constants/app_routes.dart';
import 'package:grad_proj/view/widgets/home/custom_profile_avatar.dart';
import '../../../controller/profile_controllers/edit_profile_controller.dart';
import 'custom_add_post_container.dart';

class CustomCreatePostField extends StatelessWidget {
  const CustomCreatePostField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    EditProfileControllerImpl editProfileController=Get.find();

    return Row(
      children: [
        GestureDetector(
          onTap: (){
            Get.toNamed(AppRoutes.myProfileScreen);
          },
          child: CustomProfileAvatar(
            image: editProfileController.userData.image ??
                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
          ),
        ),

        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.addPostScreen);
              },
              child: const CustomAddPostContainer(
                hintText: "What's on your mind ?",
              )),
        ),
      ],
    );
  }
}
