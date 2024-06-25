import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/constants/styles.dart';
import 'package:grad_proj/core/constants/theme_data.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../controller/community_controllers/plants_community_controller.dart';
import '../../../controller/community_controllers/post_details_controller.dart';
import '../../../core/constants/app_routes.dart';
import '../../../data/models/post_model.dart';
import '../../screens/community/post_details.dart';

class CustomLikeAndCommentRow extends StatelessWidget {
  const CustomLikeAndCommentRow({
    super.key,
    required this.index,
    required this.isDetails,
    required this.commentsController,
    required this.item,
  });

  final int index;
  final bool isDetails;
  final PostDetailsControllerImp commentsController;
  final PostModel item;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlantsCommunityControllerImp>(builder: (controller) {
      return Row(
        children: [
          IconButton(
            onPressed: () {
              controller.likePost(
                  postId: controller.posts[index].postId!,
                  likes: controller.posts[index].likes!);
            },
            icon: Icon(
              size: getValueForScreenType(
                  context: context, mobile: 24, tablet: 35),
              controller.posts[index].likes!
                      .contains(FirebaseAuth.instance.currentUser!.uid)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.red,
            ),
          ),
          Text(
            controller.posts[index].likes!.length.toString(),
            style: getValueForScreenType(
                context: context,
                mobile: Styles.textStyle16(context).copyWith(
                    color: themeController.isDarkMode.value
                        ? Colors.white70
                        : Colors.black,fontWeight: FontWeight.w300),tablet: Styles.textStyle20(context).copyWith(
                color: themeController.isDarkMode.value
                    ? Colors.white70
                    : Colors.black,fontWeight: FontWeight.w300)),
          ),
           SizedBox(width: getValueForScreenType(context: context, mobile: 0,tablet: 5),),
          IconButton(
            onPressed: isDetails
                ? () async {
                    await commentsController.getComments(postId: item.postId!);
                  }
                : () async {
                    await commentsController.getComments(postId: item.postId!);
                    Get.to(
                         () => PostDetails(index: index,item: item,),
                        duration: const Duration(milliseconds: 900),
                        transition: Transition.cupertino,
                        curve: Curves.decelerate);
                  },
            icon: Icon(
              size: getValueForScreenType(
                  context: context, mobile: 24, tablet: 35),
              Icons.comment,
              color: Colors.grey,
            ),
          ),
          Text(isDetails
              ? commentsController.comments.length.toString()
              : 'comments',style: getValueForScreenType(
              context: context,
              mobile: Styles.textStyle16(context).copyWith(
                  color: themeController.isDarkMode.value
                      ? Colors.white70
                      : Colors.black,fontWeight: FontWeight.w300),tablet: Styles.textStyle20(context).copyWith(
              color: themeController.isDarkMode.value
                  ? Colors.white70
                  : Colors.black,fontWeight: FontWeight.w300)),),
        ],
      );
    });
  }
}
