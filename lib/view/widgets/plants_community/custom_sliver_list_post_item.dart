import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/community_controllers/post_details_controller.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:grad_proj/core/constants/app_routes.dart';
import 'package:grad_proj/core/constants/styles.dart';
import 'package:grad_proj/data/models/post_model.dart';
import 'package:grad_proj/view/widgets/home/custom_cached_network_image.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../controller/community_controllers/edit_post_controller.dart';
import '../../../controller/community_controllers/plants_community_controller.dart';
import '../../screens/community/post_details.dart';
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
    ThemeController themeController = Get.find();
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
              // color: themeController.isDarkMode.value?Colors.black:null,
              border: isDetails
                  ? null
                  : Border.all(
                      color: themeController.isDarkMode.value
                          ? Colors.grey
                          : Colors.black38),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(onTap:(){
                  FirebaseAuth.instance.currentUser!.uid==item.uid?Get.toNamed(AppRoutes.myProfileScreen):null;

                },child: CustomPostHeader(headerData: item)),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: isDetails
                      ? null
                      : () async {
                          await commentsController.getComments(
                              postId: item.postId!);
                          Get.to(
                              () =>  PostDetails(index:index,item:item),
                              duration: const Duration(milliseconds: 900),
                              transition: Transition.cupertino,
                              curve: Curves.decelerate);
                        },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16,),

                      Text(
                        '${controller.posts[index].post}',
                        style: getValueForScreenType(context: context, mobile: Styles.textStyle18(context).copyWith(
                            fontWeight: FontWeight.w100,
                            color: themeController.isDarkMode.value
                                ? Colors.white
                                : Colors.black),tablet: Styles.textStyle25(context).copyWith(
                            fontWeight: FontWeight.w100,
                            color: themeController.isDarkMode.value
                                ? Colors.white
                                : Colors.black)),
                      ),
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
              ? CustomDropdownIcon(
                  editOnTap: () {
                    Get.back();
                    editAndDeleteController.controller.text =
                        controller.posts[index].post ?? "";
                    Get.toNamed(
                      AppRoutes.editPostScreen,
                      arguments: [item],
                    );
                  },
                  deleteOnTap: () async {
                    Get.back();
                    await editAndDeleteController.deletePost(
                        postId: item.postId!, fileUrl: item.fileUrl);
                  },
                )
              : const SizedBox(),
        ],
      );
    });
  }
}
