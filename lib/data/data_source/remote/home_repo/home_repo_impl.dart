import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:grad_proj/data/models/plants_model.dart';
import '../../../../core/class/api_service.dart';
import '../../../../core/class/failure.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService = Get.find();
  final String _baseUrl = 'https://perenual.com/api/';
  @override
  Future<Either<Failure, List<Datum>>> getPlants() async {
    try {
      Map<String, dynamic> data = await apiService
          .getData('$_baseUrl''species-list?key=sk-bu8C65f1041dab4504548&page=1');
      List<Datum> plantsList = [];
      plantsList = PlantsModel.fromJson(data).data;

      return right(plantsList);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }



  @override
  Future<Either<Failure, List<Datum>>> getAllPlants() async {
    try {
      List<Datum> plantsList = [];
      for (int i = 1; i < 5; i++) {
        Map<String, dynamic> data = await apiService
            .getData('$_baseUrl''species-list?key=sk-O9PP661780d434fd85066&page=$i');
        for (int j = 0; j < 29; j++) {
          plantsList.add(PlantsModel.fromJson(data).data[j]);
        }
      }
      //sk-r9GG65f0fae27a3684547
      //sk-bu8C65f1041dab4504548
      //sk-O9PP661780d434fd85066

      return right(plantsList);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }


}
