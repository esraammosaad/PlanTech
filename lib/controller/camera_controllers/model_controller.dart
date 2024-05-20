import 'package:flutter/cupertino.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/camera_controllers/camera_controller.dart';

abstract class ModelController extends GetxController {
  doImageClassification({required String image});
  loadDataModelFiles();
}

class ModelControllerImpl extends ModelController {
  bool isLoading = false;
  String result = '';
  OpenCameraControllerImpl cameraController=Get.find();

  @override
  doImageClassification({required String image}) async {
    isLoading = true;
    update();
    var recognitions = await Tflite.runModelOnImage(
      path: image,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 1,
      asynch: true,
      threshold: 0.1,
    );
    debugPrint(recognitions!.length.toString());
    for (var element in recognitions) {
      debugPrint(element.toString());
      result = element['label'];
    }
    isLoading = false;
    update();

  }

  @override
  loadDataModelFiles() async {
    String? output = await Tflite.loadModel(
      model: 'assets/model_unquant.tflite',
      labels: 'assets/label.txt',
      isAsset: true,
      numThreads: 2,
      useGpuDelegate: false,
    );

    debugPrint('$output=================================================');
  }

  @override
  Future<void> onInit() async {
    await loadDataModelFiles();
    await doImageClassification(image: cameraController.image!.path);
    debugPrint('=================================================');

    super.onInit();
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
