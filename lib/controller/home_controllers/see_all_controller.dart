import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad_proj/data/data_source/remote/home_repo/home_repo_impl.dart';
import 'package:get/get.dart';
import 'package:grad_proj/data/models/plants_model.dart';

abstract class SeeAllController extends GetxController {
  getAllData();
}

class SeeAllControllerImp extends SeeAllController {
  HomeRepoImpl dataController = Get.find();
  bool isLoading = false;
  String ? errMessage;
  List<Datum> seeAllDataList=[];




  @override
  getAllData() async {
    isLoading = true;
    update();
    try {
      var result = await dataController.getAllPlants();
      result.fold((l) {
        debugPrint(l.errMessage);
        errMessage=l.errMessage;
        isLoading = false;
        update();
      }, (r) {
        seeAllDataList=r;
        isLoading = false;
        update();

      });
    } on Exception catch (e) {
      errMessage=e.toString();
      isLoading = false;
      update();

    }
  }





  @override
  onInit() async {
    super.onInit();
    await getAllData();
    update();
  }






}
