import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:grad_proj/data/data_source/remote/my_garden_repo/my_garden_repo_impl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../data/models/image_model.dart';

abstract class MyGardenController extends GetxController {
  uploadImage({required String result, required File file});
  getMyGarden();
  deleteFromMyGarden({required String id, required String fileUrl});
  startTimer();
  String updatePostTime({required DateTime loadedTime});
  searchInMyGarden({required String text, required List<ImageModel> data});
}

class MyGardenControllerImp extends MyGardenController {
  MyGardenRepoImpl myGardenRepo = Get.find();
  File? image;
  bool isLoading = false;
  List<ImageModel>? myGarden;
  late TextEditingController controller;
  @override
  Future uploadImage({required String result, required File file}) async {
    isLoading = true;
    update();
    await myGardenRepo.uploadImage(
      result: result,
      uid: FirebaseAuth.instance.currentUser!.uid,
      file: file,
    );
    isLoading = false;
    update();
    Get.back();
  }

  @override
  onInit() async {
    controller = TextEditingController();
    await getMyGarden();
    update();
    startTimer();
    super.onInit();
  }

  @override
  deleteFromMyGarden({required String id, required String fileUrl}) async {
    isLoading = true;
    update();
    await myGardenRepo.deleteImage(
      id: id,
      fileUrl: fileUrl,
    );
    isLoading = false;
    update();
  }

  @override
  getMyGarden() async {
    isLoading = true;
    update();
    var result = await myGardenRepo.getMyGarden();
    result.fold((l) {
      debugPrint(l.errMessage);
      isLoading = false;
      update();
    }, (r) {
      myGarden = r;
      isLoading = false;
      update();
    });
  }

  @override
  startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      update();
    });
  }

  @override
  String updatePostTime({required DateTime loadedTime}) {
    final now = DateTime.now();
    final difference = now.difference(loadedTime);
    String text = timeago.format(now.subtract(difference), locale: 'en');
    startTimer();
    return text;
  }

  @override
  searchInMyGarden({required String text, required List<ImageModel> data}) {
    if (text.isNotEmpty) {
      myGarden = data
          .where(
              (item) => item.result.toLowerCase().contains(text.toLowerCase()))
          .toList();
      update();
    } else {
      getMyGarden();
      update();
    }
  }
}
