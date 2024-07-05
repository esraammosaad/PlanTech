import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grad_proj/data/data_source/remote/popular_questions_repo/popular_questions_repo.dart';
import 'package:grad_proj/data/models/popular_questions_model.dart';
import '../../../../core/class/api_service.dart';
import '../../../../core/class/failure.dart';

class PopularQuestionsRepoImpl implements PopularQuestionsRepo {
  final ApiService apiService = Get.find();
  final String _baseUrl = 'https://perenual.com/api/';
  @override
  Future<Either<Failure, List<Questions>>> getPopularQuestions() async {
    try {
      Map<String, dynamic> data = await apiService
          .getData('$_baseUrl''article-faq-list?key=sk-O9PP661780d434fd85066&page=1');
      List<Questions> popularQuestionsList = [];
      popularQuestionsList = PopularQuestionsModel.fromJson(data).data;
      debugPrint(popularQuestionsList[0].question);

      return right(popularQuestionsList);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Questions>>> getAllPopularQuestions() async {
    try {
      List<Questions> questionsList = [];
      for (int i = 1; i < 5; i++) {
        Map<String, dynamic> data = await apiService
            .getData('$_baseUrl''article-faq-list?key=sk-r9GG65f0fae27a3684547&page=$i');
        for (int j = 0; j < 29; j++) {
          questionsList.add(PopularQuestionsModel.fromJson(data).data[j]);
        }
      }
      // sk-r9GG65f0fae27a3684547
      // sk-bu8C65f1041dab4504548
      // sk-O9PP661780d434fd85066

      return right(questionsList);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
