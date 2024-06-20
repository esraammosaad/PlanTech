import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../data/data_source/remote/post_repo/post_repo_impl.dart';
import '../../data/models/post_model.dart';

abstract class MyProfileController extends GetxController {
  getMyPosts();
  startTimer();
  updatePostTime({required DateTime loadedTime});
  likePost({required String postId, required List likes});
}

class MyProfileControllerImp extends MyProfileController {
  PostsRepoImpl postsRepo = Get.find();
  bool isLoading = false;
  List<PostModel> posts = [];
  bool isFavorite = false;
  String? errMessage;

  @override
  Future<void> onInit() async {
    await getMyPosts();
    super.onInit();
    startTimer();
  }

  @override
  startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      update();
    });
  }

  @override
  String updatePostTime({required DateTime loadedTime}) {
    final now = DateTime.now();
    final difference = now.difference(loadedTime);
    String text = timeago.format(now.subtract(difference), locale: 'en');
    startTimer();
    return text;
  }

  @override
  Future getMyPosts() async {
    isLoading = true;
    update();
    var result = await postsRepo.getMyPosts();
    result.fold((l) {
      debugPrint(l.errMessage);
      isLoading = false;
      update();
    }, (r) {
      posts = r;
      isLoading = false;
      update();
    });
  }

  @override
  likePost({required String postId, required List likes}) async {
    var result = await postsRepo.likeAndDisLike(postId: postId, likes: likes);
    result.fold((l) {
      debugPrint(l.errMessage);
    }, (r) {
      isFavorite = r;
      update();
    });
  }

}
