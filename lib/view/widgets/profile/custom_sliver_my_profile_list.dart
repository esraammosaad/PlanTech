import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../controller/profile_controllers/my_profile_controller.dart';
import '../home/custom_sliver_loading_indicator.dart';
import '../plants_community/custom_sliver_list_post_item.dart';
class CustomSliverMyProfileList extends StatelessWidget {
  const CustomSliverMyProfileList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyProfileControllerImp>(builder: (controller) {
      return controller.isLoading
          ? const CustomSliverLoadingIndicator()
          : SliverList.builder(
        itemCount: controller.posts.length,
        itemBuilder: (context, index) => CustomSliverListPostItem(
            item: controller.posts[index],
            isDetails: false,
            index: index),
      );
    });
  }
}
