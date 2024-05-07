import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grad_proj/data/data_source/remote/home_repo/home_repo_impl.dart';
import 'package:get/get.dart';
import 'package:grad_proj/data/models/plants_model.dart';

abstract class HomeController extends GetxController {
  slider(int index);
  getData();
  searchForPlants({required String text});
}

class HomeControllerImp extends HomeController {
  int currentIndex = 0;
  HomeRepoImpl dataController = Get.find();
  bool isLoading = false;
  List<Datum> dataList = [];
  String? errMessage;
  List<Datum> searchResult = [];
   TextEditingController searchController= TextEditingController();

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
      errMessage = l.errMessage;
      isLoading = false;
      update();
    }, (r) {
      dataList = r;
      isLoading = false;
      update();
    });
  }

  @override
  searchForPlants({
    required String text,
  }) {
    if (text.isNotEmpty) {
      searchResult = dataList.where((item) {
        return item.commonName!.toLowerCase().contains(text.toLowerCase());


            // ||
            // item.otherName[0]!.toLowerCase().contains(text.toLowerCase()) ||
            // item.scientificName[0]!.toLowerCase().contains(text.toLowerCase())
      }).toList();
      update();
    } else {
      searchResult.clear();
      update();
    }
  }

  @override
  onInit() async {
    super.onInit();
    await getData();
    update();

  }
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
