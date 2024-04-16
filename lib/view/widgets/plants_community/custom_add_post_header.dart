import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../controller/community_controllers/plants_community_controller.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/styles.dart';
import '../home/custom_profile_avatar.dart';

class CustomAddPostHeader extends StatelessWidget {
  const CustomAddPostHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlantsCommunityControllerImp>(builder: (controller) {
      return Row(
        children: [
          SizedBox(
              width: 40,
              height: 40,
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
                style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w500),
              ),
              Text(
                'public',
                style: Styles.textStyle12.copyWith(color: AppColors.greyColor),
              ),
            ],
          )
        ],
      );
    });
  }
}
