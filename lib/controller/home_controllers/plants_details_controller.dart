import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/data/data_source/remote/plants_details_repo/plants_details_repo_impl.dart';
import 'package:grad_proj/data/models/plants_details_model.dart';

abstract class PlantsDetailsController extends GetxController {
  getPlantsData({required int id});
}

class PlantsDetailsControllerImp extends PlantsDetailsController {
  PlantsDetailsRepoImpl dataController = Get.find();
  bool isLoading = false;
  late PlantsDetailsModel ? plantsData;



  @override
  getPlantsData({required int id}) async {
    isLoading = true;
    update();
    var result = await dataController.getPlantsDetails(id: id);
    result.fold((l) {
      debugPrint(l.errMessage);
      isLoading = false;
      update();
    }, (r) {
      isLoading = false;
      update();
      plantsData=r;
      debugPrint(r.dimension);


    });
  }











}
