import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/community_controllers/plants_community_controller.dart';
import '../../../controller/community_controllers/post_details_controller.dart';
import '../../../core/constants/app_routes.dart';
import '../../../data/models/post_model.dart';
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
    return GetBuilder<PlantsCommunityControllerImp>(
        builder: (controller) {
          return Row(
            children: [
              IconButton(
                onPressed: () {
                  controller.likePost(
                      postId: controller.posts[index].postId!,
                      likes: controller.posts[index].likes!);
                },
                icon: Icon(
                  controller.posts[index].likes!
                      .contains(FirebaseAuth.instance.currentUser!.uid)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                ),
              ),
              Text(controller.posts[index].likes!.length.toString()),
              IconButton(
                onPressed: isDetails?() async {
                  await commentsController.getComments(postId: item.postId!);
                }:() async {
                  await commentsController.getComments(postId: item.postId!);
                  Get.toNamed(AppRoutes.postDetailsScreen,arguments: [item,index]);

                },
                icon: const Icon(
                  Icons.comment,
                  color: Colors.grey,
                ),
              ),
              Text(isDetails?commentsController.comments.length.toString():'comments'),
            ],
          );
        }
    );
  }
}
