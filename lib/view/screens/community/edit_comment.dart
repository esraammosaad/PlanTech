import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/community_controllers/edit_comments_controller.dart';
import 'package:grad_proj/controller/community_controllers/post_details_controller.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/data/models/comment_model.dart';
import 'package:grad_proj/view/widgets/plants_community/custom_edit_and_add_post_app_bar.dart';
import 'package:grad_proj/view/widgets/home/custom_material_button.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/class/them_controller.dart';
import '../../../core/constants/styles.dart';

class EditComment extends StatelessWidget {
  const EditComment({Key? key, required this.comment, required this.postId})
      : super(key: key);
  final CommentModel comment;
  final String postId;

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();

    return Scaffold(
      appBar: customEditAndAddPostAppBar(context, text: 'Editing  '),
      body: SafeArea(
        child: GetBuilder<EditAndDeleteCommentControllerImp>(
            builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ScreenTypeLayout.builder(
                mobile: (context) => CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                        child: Column(
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
                                  comment.userName == null ||
                                          comment.userName == ''
                                      ? 'person'
                                      : comment.userName!,
                                  style: Styles.textStyle14(context).copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: themeController.isDarkMode.value
                                          ? Colors.white70
                                          : Colors.black),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  autofocus: true,
                                  cursorColor: AppColors.kPrimaryColor,
                                  controller: controller.controller,
                                  decoration: InputDecoration(
                                    border: buildUnderlineInputBorder(),
                                    focusedBorder: buildUnderlineInputBorder(),
                                    enabledBorder: buildUnderlineInputBorder(),
                                    disabledBorder: buildUnderlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                            subtitle: GetBuilder<PostDetailsControllerImp>(
                              builder: (commentController) {
                                return Row(
                                  children: [
                                    Text(
                                      commentController.updateCommentTime(
                                          loadedTime: comment.time!),
                                      style: Styles.textStyle12(context)
                                          .copyWith(color: AppColors.kGreyColor),
                                    ),
                                  ],
                                );
                              }
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        controller.isLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.kPrimaryColor,
                                ),
                              )
                            : CustomMaterialButton(
                                text: 'submit',
                                onPressed: () async {
                                  await controller.editComment(
                                      postId: postId,
                                      comment: controller.controller.text,
                                      commentId: comment.commentId!);
                                },
                              )
                      ],
                    )),
                  ],
                ),
                tablet: (context) => Row(
                  children: [
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                        flex: 5,
                        child: CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                                child: Column(
                              children: [
                                Card(
                                  color: themeController.isDarkMode.value
                                      ? Colors.black
                                      : AppColors.backgroundColor,
                                  elevation: 0,
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color:
                                              themeController.isDarkMode.value
                                                  ? Colors.black12
                                                  : AppColors.kGreyColor)),
                                  child: ListTile(
                                    leading: SizedBox(
                                      child: CircleAvatar(
                                        radius: getValueForScreenType(
                                            context: context,
                                            mobile: 25,
                                            tablet: 30),
                                        backgroundImage: NetworkImage(FirebaseAuth
                                                .instance
                                                .currentUser
                                                ?.photoURL ??
                                            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'),
                                      ),
                                    ),
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          comment.userName == null ||
                                                  comment.userName == ''
                                              ? 'person'
                                              : comment.userName!,
                                          style: Styles.textStyle14(context)
                                              .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: themeController
                                                          .isDarkMode.value
                                                      ? Colors.white70
                                                      : Colors.black),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        TextField(
                                          autofocus: true,
                                          cursorColor: AppColors.kPrimaryColor,
                                          controller: controller.controller,
                                          decoration: InputDecoration(
                                            border: buildUnderlineInputBorder(),
                                            focusedBorder:
                                                buildUnderlineInputBorder(),
                                            enabledBorder:
                                                buildUnderlineInputBorder(),
                                            disabledBorder:
                                                buildUnderlineInputBorder(),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                      ],
                                    ),
                                    subtitle: Row(
                                      children: [
                                        GetBuilder<PostDetailsControllerImp>(
                                            builder: (commentController) {
                                              return Row(
                                                children: [
                                                  Text(
                                                    commentController.updateCommentTime(
                                                        loadedTime: comment.time!),
                                                    style: Styles.textStyle12(context)
                                                        .copyWith(color: AppColors.kGreyColor),
                                                  ),
                                                ],
                                              );
                                            }
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                controller.isLoading
                                    ? Center(
                                        child: CircularProgressIndicator(
                                          color: AppColors.kPrimaryColor,
                                        ),
                                      )
                                    : CustomMaterialButton(
                                        text: 'submit',
                                        onPressed: () async {
                                          await controller.editComment(
                                              postId: postId,
                                              comment:
                                                  controller.controller.text,
                                              commentId: comment.commentId!);
                                        },
                                      )
                              ],
                            )),
                          ],
                        )),
                    Expanded(flex: 1, child: Container()),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  UnderlineInputBorder buildUnderlineInputBorder() {
    return UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.kGreyColor));
  }
}
