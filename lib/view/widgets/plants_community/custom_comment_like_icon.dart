import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../controller/home_controllers/post_details_controller.dart';
import '../../../data/models/post_model.dart';
class CustomCommentLikeIcon extends StatelessWidget {
  const CustomCommentLikeIcon({
    super.key,
    required this.index,
    required this.item,
  });

  final int index;
  final PostModel item;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostDetailsControllerImp>(
        builder: (controller) {
          return GestureDetector(
              onTap: () {
                controller.likeComment(
                    commentId: controller.comments[index].commentId!,
                    likes: controller.comments[index].likes!,postId: item.postId!);
              },
              child:  Icon(
                controller.comments[index].likes!
                    .contains(FirebaseAuth.instance.currentUser!.uid)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Colors.red,
                size: 16,
              ));
        }
    );
  }
}
