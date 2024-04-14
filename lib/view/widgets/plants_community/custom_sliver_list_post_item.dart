import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/home_controllers/plants_community_controller.dart';
import 'package:grad_proj/controller/home_controllers/post_details_controller.dart';
import 'package:grad_proj/core/constants/app_routes.dart';
import 'package:grad_proj/data/models/post_model.dart';
import 'package:grad_proj/view/widgets/home/custom_cached_network_image.dart';
import 'custom_like_and_comment_row.dart';
import 'custom_post_header.dart';

class CustomSliverListPostItem extends StatelessWidget {
  const CustomSliverListPostItem({super.key, required this.item, required this.isDetails, required this.index});
  final PostModel item;
  final bool isDetails;
  final int index;

  @override
  Widget build(BuildContext context) {
    PostDetailsControllerImp commentsController=Get.find();
    return GetBuilder<PlantsCommunityControllerImp>(builder: (controller) {
      return Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              border: isDetails?null:Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomPostHeader(headerData: item),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: isDetails?null:() async {
                    await commentsController.getComments(postId: item.postId!);
                    Get.toNamed(AppRoutes.postDetailsScreen,arguments: [item,index]);

                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('${item.post}'),
                    const SizedBox(
                      height: 16,
                    ),
                    item.fileUrl!= ''
                        ? CustomCachedNetworkImage(
                      image: item.fileUrl!,
                    )
                        : const SizedBox(),
                    const SizedBox(
                      height: 8,
                    ),
                  ],),
                ),
                CustomLikeAndCommentRow(index: index, isDetails: isDetails, commentsController: commentsController, item: item)
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_outlined),
          ),
        ],
      );
    });
  }
}

