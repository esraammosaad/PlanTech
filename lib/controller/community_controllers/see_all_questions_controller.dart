import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/data/data_source/remote/popular_questions_repo/popular_questions_repo_impl.dart';
import 'package:grad_proj/data/models/popular_questions_model.dart';

abstract class SeeAllQuestionsController extends GetxController {
  getAllQuestions();
}

class SeeAllQuestionsControllerImp extends SeeAllQuestionsController {
  PopularQuestionsRepoImpl dataController = Get.find();
  bool isLoading = false;
  String? errMessage;
  List<Questions> seeAllDataList = [];

  @override
  getAllQuestions() async {
    isLoading = true;
    update();
    try {
      var result = await dataController.getAllPopularQuestions();
      result.fold((l) {
        debugPrint(l.errMessage);
        errMessage = l.errMessage;
        isLoading = false;
        update();
      }, (r) {
        seeAllDataList = r;
        isLoading = false;
        update();
      });
    } on Exception catch (e) {
      errMessage = e.toString();
      isLoading = false;
      update();
    }
  }

  @override
  onInit() async {
    super.onInit();
    await getAllQuestions();
    update();
  }
}
