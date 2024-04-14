import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:grad_proj/view/widgets/home/custom_sliver_loading_indicator.dart';
import '../../../controller/home_controllers/plants_community_controller.dart';
import 'custom_sliver_list_post_item.dart';

class CustomPlantsCommunitySliverList extends StatelessWidget {
  const CustomPlantsCommunitySliverList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlantsCommunityControllerImp>(builder: (controller) {
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
