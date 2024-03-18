import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:grad_proj/data/models/product_model.dart';
import '../../../../core/class/api_service.dart';
import '../../../../core/class/failure.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRepoImpl();
  final ApiService apiService=Get.find();
  @override
  Future<Either<Failure, List<Datum>>> getPlants() async {
    try {
      Map<String , dynamic> data=await apiService.getData('species-list?key=sk-r9GG65f0fae27a3684547&page=1');
      List<Datum> plantsList = [];
      plantsList=PlantsModel.fromJson(data).data;



      return right(plantsList);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }


}
