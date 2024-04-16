import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/class/posts_services.dart';

abstract class EditAndDeletePostController extends GetxController {
  editPost({
    required String postId,
    required String post,
    required String fileUrl,
  });
  deletePost({
    required String postId,
    required String ? fileUrl,
  });
}

class EditAndDeletePostControllerImp extends EditAndDeletePostController {
  PostsRepo postsRepo = Get.find();
  late TextEditingController controller;
  bool isLoading = false;
  @override
  Future editPost({
    required String postId,
    required String post,
    required String fileUrl,
  }) async {
    isLoading = true;
    update();
    await postsRepo.editPost(
      postId: postId,
      post: post,
      fileUrl: fileUrl,
    );
    isLoading = false;
    update();
    Get.back();
  }
  @override
  Future deletePost({
    required String postId,
    required String ? fileUrl,
  }) async {
    isLoading = true;
    update();
    await postsRepo.deletePost(
      postId: postId,
      fileUrl: fileUrl,
    );
    isLoading = false;
    update();

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
