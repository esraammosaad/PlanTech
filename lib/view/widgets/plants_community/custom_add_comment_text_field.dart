import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/home_controllers/post_details_controller.dart';
import 'package:grad_proj/core/constants/color.dart';

class CustomAddCommentTextField extends StatelessWidget {
  const CustomAddCommentTextField({
    super.key,
    required this.postId,
  });
  final String postId;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostDetailsControllerImp>(builder: (controller) {
      return TextField(
          controller: controller.commentController,
          onSubmitted: (value) async {
            debugPrint(value);
            controller.addComment(postId: postId);

            controller.commentController.clear();
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                Icons.send,
                color: AppColors.kPrimaryColor,
              ),
              onPressed: () async {
                controller.addComment(postId: postId);
                controller.commentController.clear();
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                borderSide: BorderSide(color: AppColors.kPrimaryColor)),
            hintText: 'Add Comment',
            enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                borderSide: BorderSide(color: AppColors.kPrimaryColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                borderSide: BorderSide(color: AppColors.kPrimaryColor)),
          ));
    });
  }
}
