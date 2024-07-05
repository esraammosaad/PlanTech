import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:grad_proj/data/data_source/remote/plants_details_repo/plants_datails_repo.dart';
import 'package:grad_proj/data/models/care_guide_model.dart';
import '../../../../core/class/api_service.dart';
import '../../../../core/class/failure.dart';
import '../../../models/plants_details_model.dart';

class PlantsDetailsRepoImpl implements PlantsDetailsRepo {
  final ApiService apiService = Get.find();
  final String _baseUrl = 'https://perenual.com/api/';
  @override
  Future<Either<Failure, PlantsDetailsModel>> getPlantsDetails(
      {required int id}) async {
    try {
      Map<String,dynamic> data = await apiService
          .getData('$_baseUrl''species/details/$id?key=sk-O9PP661780d434fd85066');
      print(data);
      PlantsDetailsModel plantsDetailsData = PlantsDetailsModel.fromJson(data);

      return right(plantsDetailsData);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
  @override
  Future<Either<Failure, List<CareGuideData>?>> careGuide(
      {required String url }) async {
    try {
      Map<String,dynamic> data = await apiService
          .getData(url);
      print(data);
      List<CareGuideData>? careGuideList = [];
      careGuideList = CareGuideModel.fromJson(data).data;
      print(careGuideList?.length);


      return right(careGuideList);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
