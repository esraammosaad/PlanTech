import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/community_controllers/post_details_controller.dart';
import 'package:grad_proj/data/models/post_model.dart';
import 'package:grad_proj/view/widgets/home/custom_sliver_loading_indicator.dart';
import 'package:grad_proj/view/widgets/home/custom_sliver_try_again_text.dart';
import 'custom_comments_sliver_list_item.dart';

class CustomCommentsSliverList extends StatelessWidget {
  const CustomCommentsSliverList({
    super.key,
    required this.item,
  });
  final PostModel item;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostDetailsControllerImp>(builder: (controller) {
      return controller.comments.isEmpty?const CustomSliverTryAgainText(text: 'No Comments ....',): controller.isLoading
          ? const CustomSliverLoadingIndicator()
          : SliverList.builder(
              itemBuilder: (context, index) =>
                  CustomCommentsSliverListItem(index: index, item: item),
              itemCount: controller.comments.length);
    });
  }
}
