import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grad_proj/data/data_source/remote/post_repo/post_repo_impl.dart';

abstract class EditAndDeleteCommentController extends GetxController {
  Future deleteComment({
    required String postId,
    required String commentId,
  });
  Future editComment({
    required String postId,
    required String comment,
    required String commentId,
  });
}

class EditAndDeleteCommentControllerImp extends EditAndDeleteCommentController {
  PostsRepoImpl postsRepo = Get.find();
  late TextEditingController controller;
  bool isLoading = false;
  @override
  Future deleteComment({
    required String postId,
    required String commentId,
  }) async {
    isLoading = true;
    update();
    await postsRepo.deleteComment(
      postId: postId,
      commentId: commentId,
    );
    isLoading = false;
    update();
  }

  @override
  Future editComment({
    required String postId,
    required String comment,
    required String commentId,
  }) async {
    isLoading = true;
    update();
    await postsRepo.editComment(
      postId: postId,
      commentId: commentId,
      comment: comment,
    );
    isLoading = false;
    update();
    Get.back();
  }

  @override
  void onInit() {
    controller = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
