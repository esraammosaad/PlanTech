import 'package:flutter/cupertino.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:get/get.dart';
import 'package:grad_proj/controller/camera_controllers/camera_controller.dart';
import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';



abstract class ModelController extends GetxController {
  doImageClassification({required String image});
  loadDataModelFiles();
}

class ModelControllerImpl extends ModelController {
  bool isLoading = false;
  String result = '';
  OpenCameraControllerImpl cameraController = Get.find();
  Future<String> resizeAndSaveImage(String imagePath) async {
    img.Image image = img.decodeImage(File(imagePath).readAsBytesSync())!;
    img.Image resizedImage = img.copyResize(image, width: 224, height: 224);
    final tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    String tempFilePath = join(tempPath, 'resized_image.png');

    File(tempFilePath)..writeAsBytesSync(img.encodePng(resizedImage));
    return tempFilePath;
  }
  @override
  doImageClassification({required String image}) async {
    isLoading = true;
    update();

    var recognitions = await Tflite.runModelOnImage(
        path: await resizeAndSaveImage(image),
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
