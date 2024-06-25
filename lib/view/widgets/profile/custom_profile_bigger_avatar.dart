import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/profile_controllers/edit_profile_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shimmer/shimmer.dart';

class CustomProfileBiggerAvatar extends StatelessWidget {
  const CustomProfileBiggerAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileControllerImpl>(
        builder: (controller) => controller.image != null
            ? CircleAvatar(
                radius: 35,
                backgroundImage: FileImage(controller.image!),
              )
            : controller.isLoading? Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
              period: const Duration(seconds: 1),
              direction: ShimmerDirection.ttb,

              child:const CircleAvatar(radius: 60,backgroundColor: Colors.white,),
            ):CircleAvatar(
                radius: getValueForScreenType<double>(
                  context: context,
                  mobile: 35,
                  tablet: 60,
                ),
                backgroundImage: CachedNetworkImageProvider(controller.userData.image),
              ));
  }
}
