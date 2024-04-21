import 'dart:async';
import 'package:grad_proj/data/models/comment_model.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grad_proj/data/data_source/remote/post_repo/post_repo_impl.dart';

abstract class PostDetailsController extends GetxController {
  addComment({required String postId});
  getComments({required String postId});
  startTimer();
  updateCommentTime({required DateTime loadedTime});
  likeComment({required String postId, required List likes ,required String commentId});

}

class PostDetailsControllerImp extends PostDetailsController {
  PostsRepoImpl postsRepo = Get.find();
  late TextEditingController commentController;
  bool isLoading = false;
  List<CommentModel> comments = [];
  late ScrollController scrollController;




  @override
  void onInit() {
    startTimer();
    commentController = TextEditingController();
    scrollController=ScrollController();
    super.onInit();

  }
  @override
  Future getComments({required String postId}) async {
    isLoading = true;
    update();
    var result = await postsRepo.getPostComments(postId: postId);
    result.fold((l) {
      debugPrint(l.errMessage);
      isLoading = false;
      update();
    }, (r) {
      comments = r;
      isLoading = false;
      update();
    });
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  addComment({required String postId}) async {
    isLoading = true;
    update();
    await postsRepo.makeComment(
        comment: commentController.text, postId: postId);
    await scrollController.animateTo(
      0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
    isLoading = false;
    update();
  }

  @override
  startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      update();
    });
  }

  @override
  String updateCommentTime({required DateTime loadedTime}) {
    final now = DateTime.now();
    final difference = now.difference(loadedTime);
    String text = timeago.format(now.subtract(difference), locale: 'en');
    startTimer();
    return text;
  }
  @override
  likeComment({required String postId, required List likes , required String commentId,}) async {
    var result=await postsRepo.commentsLikeAndDisLike(commentId: commentId, postId: postId, likes: likes);
    result.fold((l) {
      debugPrint(l.errMessage);
    }, (r) {
      update();
    });
  }
}
