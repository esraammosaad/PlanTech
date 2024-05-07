import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_routes.dart';
import '../plants_community/custom_add_post_container.dart';
class CustomMyProfileAddPostField extends StatelessWidget {
  const CustomMyProfileAddPostField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.addPostScreen);
            },
            child: const CustomAddPostContainer(
              hintText: "What's on your mind ?",
            )),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
