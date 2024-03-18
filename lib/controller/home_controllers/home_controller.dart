import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad_proj/data/data_source/remote/home_repo/home_repo_impl.dart';
import 'package:get/get.dart';
import 'package:grad_proj/data/models/product_model.dart';

abstract class HomeController extends GetxController {
  slider(int index);
  getData();
}

class HomeControllerImp extends HomeController {
  int currentIndex = 0;
  HomeRepoImpl dataController = Get.find();
  bool isLoading = false;
  List<Datum> dataList=[];

  @override
  slider(int index) {
    currentIndex = index;
    update();
  }

  @override
  getData() async {
    isLoading = true;
    update();
    var result = await dataController.getPlants();
    result.fold((l) {
      debugPrint(l.errMessage);
      isLoading = false;
      update();
    }, (r) {
      dataList=r;
      isLoading = false;
      update();
      for (int i = 0; i < r.length; i++) {
      }
    });
  }





  @override
  onInit() async {
    super.onInit();
    await getData();
    update();
  }






}