import 'package:flutter/cupertino.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/camera_controllers/camera_controller.dart';




abstract class ModelController extends GetxController {
  doImageClassification({required String image});
  loadDataModelFiles();
}

class ModelControllerImpl extends ModelController {
  bool isLoading = true;
  String result = '';
  double ? accuracy;
  OpenCameraControllerImpl cameraController = Get.find();

  @override
  doImageClassification({required String image}) async {
    isLoading = true;
    update();

    var recognitions = await Tflite.runModelOnImage(
        path: await image,
        imageMean: 117, // Adjusted mean value for your model
        imageStd: 1,
        numResults: 5,
        threshold: 0.1,
        asynch: true);
    debugPrint(recognitions!.length.toString());
    debugPrint(image);
    for (var element in recognitions) {
      debugPrint(element.toString());

       result = element['label'];
       accuracy = element['confidence'];

    }
    isLoading = false;
    update();
  }

  @override
  loadDataModelFiles() async {
    String? output = await Tflite.loadModel(
      model: 'assets/plant_model.tflite',
      labels: 'assets/model_labels.txt',
      isAsset: true,
      numThreads: 1,
      useGpuDelegate: false,
    );
    isLoading=false;

    debugPrint('$output=================================================');
  }

  @override
  Future<void> onInit() async {
    await loadDataModelFiles();
    await doImageClassification(image: cameraController.image!.path);
    isLoading=false;
    debugPrint('=================================================');

    super.onInit();
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
