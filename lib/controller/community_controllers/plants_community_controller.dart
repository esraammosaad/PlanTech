import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grad_proj/data/data_source/remote/popular_questions_repo/popular_questions_repo_impl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../core/class/posts_services.dart';
import '../../data/models/popular_questions_model.dart';
import '../../data/models/post_model.dart';

abstract class PlantsCommunityController extends GetxController {
  getPosts();
  getPopularQuestions();
  startTimer();
  updatePostTime({required DateTime loadedTime});
  likePost({required String postId, required List likes});
}

class PlantsCommunityControllerImp extends PlantsCommunityController {
  PostsRepo postsRepo = Get.find();
  bool isLoading = false;
  List<PostModel> posts = [];
  bool isFavorite = false;
  String? errMessage;
  PopularQuestionsRepoImpl dataController = Get.find();
  List<Questions> questionsList = [];

  @override
  Future<void> onInit() async {
    await getPosts();
    await getPopularQuestions();
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
  Future getPosts() async {
    isLoading = true;
    update();
    var result = await postsRepo.getAllPosts();
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

  @override
  getPopularQuestions() async {
    isLoading = true;
    update();
    var result = await dataController.getPopularQuestions();
    result.fold((l) {
      debugPrint(l.errMessage);
      errMessage = l.errMessage;
      isLoading = false;
      update();
    }, (r) {
      questionsList = r;
      isLoading = false;
      update();
    });
  }
}
