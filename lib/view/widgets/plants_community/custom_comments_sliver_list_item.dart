import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/community_controllers/edit_comments_controller.dart';
import 'package:grad_proj/controller/community_controllers/post_details_controller.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:grad_proj/data/models/post_model.dart';
import 'package:grad_proj/view/screens/community/edit_comment.dart';
import 'package:grad_proj/view/widgets/plants_community/custom_drop_down_icon.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/styles.dart';
import 'custom_comment_like_icon.dart';

class CustomCommentsSliverListItem extends StatelessWidget {
  const CustomCommentsSliverListItem({
    super.key,
    required this.index,
    required this.item,
  });
  final int index;
  final PostModel item;

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return GetBuilder<PostDetailsControllerImp>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(
          bottom: 5.0,
        ),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Card(
              color: themeController.isDarkMode.value
                  ? Colors.black
                  : AppColors.backgroundColor,
              elevation: 0,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                      color: themeController.isDarkMode.value
                          ? Colors.black12
                          : AppColors.kGreyColor)),
              child: ListTile(
                leading: SizedBox(
                  child: CircleAvatar(
                    radius: getValueForScreenType(
                        context: context, mobile: 25, tablet: 30),
                    backgroundImage: NetworkImage(FirebaseAuth
                            .instance.currentUser?.photoURL ??
                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.comments[index].userName == null ||
                              controller.comments[index].userName == ''
                          ? 'person'
                          : controller.comments[index].userName!,
                      style: Styles.textStyle14(context).copyWith(
                          fontWeight: FontWeight.w500,
                          color: themeController.isDarkMode.value
                              ? Colors.white70
                              : Colors.black),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      controller.comments[index].comment ?? "",
                      style: Styles.textStyle14(context).copyWith(
                          color: themeController.isDarkMode.value
                              ? Colors.white
                              : AppColors.kPrimaryColor),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
                subtitle: Row(
                  children: [
                    Text(
                      controller.updateCommentTime(
                          loadedTime: controller.comments[index].time!),
                      style: Styles.textStyle12(context)
                          .copyWith(color: AppColors.kGreyColor),
                    ),
                    const Spacer(),
                    CustomCommentLikeIcon(index: index, item: item),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      controller.comments[index].likes!.length.toString(),
                      style: Styles.textStyle12(context).copyWith(
                          color: themeController.isDarkMode.value
                              ? Colors.white
                              : Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            controller.comments[index].uid ==
                    FirebaseAuth.instance.currentUser!.uid
                ? Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: GetBuilder<EditAndDeleteCommentControllerImp>(
                      builder: (commentController) {
                        return CustomDropdownIcon(deleteOnTap: () async {
                          Get.back();
                          await commentController.deleteComment(
                              postId: item.postId!,
                              commentId: controller.comments[index].commentId!);
                        }, editOnTap: () {
                          Get.back();
                          commentController.controller.text =
                              controller.comments[index].comment ?? "";
                          Get.to(
                              () => EditComment(
                                    comment: controller.comments[index],
                                    postId: item.postId!,
                                  ),
                              transition: Transition.cupertino,
                              duration: const Duration(milliseconds: 900),
                              curve: Curves.decelerate);
                        });
                      }
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      );
    });
  }
}
