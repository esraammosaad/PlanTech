import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/community_controllers/post_details_controller.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:grad_proj/core/constants/color.dart';

class CustomAddCommentTextField extends StatelessWidget {
  const CustomAddCommentTextField({
    super.key,
    required this.postId,
  });
  final String postId;
  static ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.find();
    return GetBuilder<PostDetailsControllerImp>(builder: (controller) {
      return Padding(
        padding:  EdgeInsets.only(right: 8.0,left: 8,bottom: MediaQuery.of(context).viewInsets.bottom),
        child: TextField(
            maxLines: null,
            minLines: 1,
            keyboardType: TextInputType.multiline,
            controller: controller.commentController,
            onSubmitted: (value) async {
              debugPrint(value);
              controller.addComment(postId: postId);

              controller.commentController.clear();
            },
            cursorColor: AppColors.kPrimaryColor,
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
                  borderRadius:  BorderRadius.circular(25),
                  borderSide: BorderSide(color: AppColors.kPrimaryColor)),
              hintText: 'Add Comment ..........',
              fillColor: themeController.isDarkMode.value
                  ? Colors.black
                  : AppColors.backgroundColor,
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: AppColors.kPrimaryColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: AppColors.kPrimaryColor)),
            )),
      );
    });
  }
}
