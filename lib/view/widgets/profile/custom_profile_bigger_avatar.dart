import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/home_controllers/profile_controller.dart';
import 'package:grad_proj/view/widgets/profile/custom_profile_column.dart';

class CustomProfileBiggerAvatar extends StatelessWidget {
  const CustomProfileBiggerAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileControllerImpl>(
        builder: (controller) => controller.image != null
            ? CircleAvatar(
                radius: 35,
                backgroundImage: FileImage(controller.image!),
              )
            : controller.isLoading?const Padding(
              padding: EdgeInsets.all(16.0),
              child: CustomCenterLoadingIndicator(),
            ):CircleAvatar(
                radius: 35,
                backgroundImage: CachedNetworkImageProvider(controller.userData.image),
              ));
  }
}
