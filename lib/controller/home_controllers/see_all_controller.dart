import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad_proj/data/data_source/remote/home_repo/home_repo_impl.dart';
import 'package:get/get.dart';
import 'package:grad_proj/data/models/plants_model.dart';

abstract class SeeAllController extends GetxController {
  getAllData();
}

class SeeAllControllerImp extends SeeAllController {
  int currentIndex = 0;
  HomeRepoImpl dataController = Get.find();
  bool isLoading = false;
  List<Datum> dataList=[];




  @override
  getAllData() async {
    isLoading = true;
    update();
    var result = await dataController.getAllPlants();
    result.fold((l) {
      debugPrint(l.errMessage);
      isLoading = false;
      update();
    }, (r) {
      dataList=r;
      isLoading = false;
      update();

    });
  }





  @override
  onInit() async {
    super.onInit();
    await getAllData();
    update();
  }






}
