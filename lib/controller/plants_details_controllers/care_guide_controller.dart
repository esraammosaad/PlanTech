import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/data/data_source/remote/plants_details_repo/plants_details_repo_impl.dart';
import 'package:grad_proj/data/models/care_guide_model.dart';


abstract class CareGuideController extends GetxController {
  getCareGuideData({required String url});
}

class CareGuideControllerImp extends CareGuideController {
  PlantsDetailsRepoImpl dataController = Get.find();
  bool isLoading = false;
  CareGuideData ? careGuideData;
  String ?errMessage;



  @override
  getCareGuideData({required String url}) async {
    isLoading = true;
    update();
    try {
      var result = await dataController.careGuide(url: url);
      result.fold((l) {
        debugPrint(l.errMessage);
        errMessage=l.errMessage;
        isLoading = false;
        update();
      }, (r) {

        careGuideData=r?[0];
        isLoading = false;
        update();


      });
    } on Exception catch (e) {
      debugPrint(e.toString());
      errMessage=e.toString();
      isLoading = false;
      update();
    }
  }











}
