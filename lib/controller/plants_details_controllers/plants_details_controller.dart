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
   PlantsDetailsModel ? plantsData;
  String ?errMessage;



  @override
  getPlantsData({required int id}) async {
    isLoading = true;
    update();
    try {
      var result = await dataController.getPlantsDetails(id: id);
      result.fold((l) {
        debugPrint(l.errMessage);
        errMessage=l.errMessage;
        isLoading = false;
        update();
      }, (r) {

        plantsData=r;
        isLoading = false;
        update();
        debugPrint(r.dimension);


      });
    } on Exception catch (e) {
      debugPrint(e.toString());
      errMessage=e.toString();
      isLoading = false;
      update();
    }
  }











}
