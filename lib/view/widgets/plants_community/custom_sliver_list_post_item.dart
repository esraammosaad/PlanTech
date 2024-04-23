import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/community_controllers/post_details_controller.dart';
import 'package:grad_proj/core/constants/app_routes.dart';
import 'package:grad_proj/data/models/post_model.dart';
import 'package:grad_proj/view/widgets/home/custom_cached_network_image.dart';
import '../../../controller/community_controllers/edit_post_controller.dart';
import '../../../controller/community_controllers/plants_community_controller.dart';
import 'custom_drop_down_icon.dart';
import 'custom_like_and_comment_row.dart';
import 'custom_post_header.dart';

class CustomSliverListPostItem extends StatelessWidget {
  const CustomSliverListPostItem(
      {super.key,
      required this.item,
      required this.isDetails,
      required this.index});
  final PostModel item;
  final bool isDetails;
  final int index;

  @override
  Widget build(BuildContext context) {
    PostDetailsControllerImp commentsController = Get.find();
    EditAndDeletePostControllerImp editAndDeleteController = Get.find();
    return GetBuilder<PlantsCommunityControllerImp>(builder: (controller) {
      return Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              border: isDetails ? null : Border.all(color: Colors.black38),
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
                  onTap: isDetails
                      ? null
                      : () async {
                          await commentsController.getComments(
                              postId: item.postId!);
                          Get.toNamed(AppRoutes.postDetailsScreen,
                              arguments: [item, index]);
                        },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${item.post}'),
                      const SizedBox(
                        height: 16,
                      ),
                      item.fileUrl != ''
                          ? CustomCachedNetworkImage(
                              image: item.fileUrl!,
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
                CustomLikeAndCommentRow(
                    index: index,
                    isDetails: isDetails,
                    commentsController: commentsController,
                    item: item),
              ],
            ),
          ),
          item.uid == FirebaseAuth.instance.currentUser!.uid
              ? CustomDropdownIcon(editOnTap: () {
            editAndDeleteController.controller.text = item.post ?? "";
            Get.toNamed(AppRoutes.editPostScreen, arguments: [item],);

          },deleteOnTap: () async {
            Get.back();
            await editAndDeleteController.deletePost(postId: item.postId!, fileUrl: item.fileUrl);
            print(item.fileUrl);
          },)
              : const SizedBox(),
        ],
      );
    });
  }
}
