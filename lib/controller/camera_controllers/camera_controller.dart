import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../core/functions/pick_and_capture_image.dart';
import '../../main.dart';

abstract class OpenCameraController extends GetxController {
  initializeController();
  setFlash();
  flipCamera();
  takePhoto();
  pickPhotoFromGallery();
  close();
}

class OpenCameraControllerImpl extends OpenCameraController {
  late CameraController controller;
  bool isFlashOn = false;
  bool isFrontCamera = false;
  XFile? photo;
  late ImagePicker imagePicker;
  bool isLoading = false;
  File? image;

  @override
  initializeController() {
    int cameraPos = isFrontCamera ? 1 : 0;
    controller = CameraController(cameras[cameraPos], ResolutionPreset.max);
    controller.initialize().then((value) {
      update();
    }).catchError((Object e) {
      if (e is CameraException) {
        debugPrint(e.description);
      }
    });
  }

  @override
  void onInit() {
    initializeController();
    imagePicker = ImagePicker();
    super.onInit();
  }

  @override
  flipCamera() {
    isFrontCamera = !isFrontCamera;
    initializeController();
    update();
  }

  @override
  setFlash() async {
    isFlashOn = !isFlashOn;
    await controller.setFlashMode(isFlashOn ? FlashMode.torch : FlashMode.off);
    update();
  }

  @override
  takePhoto() async {
    if (controller.value.isInitialized) {
      try {
        isLoading = true;
        update();
        await controller.setFlashMode(FlashMode.auto);
        photo = await controller.takePicture();
        if (photo != null) {
          image = File(photo!.path);
        }
        isLoading = false;
        isFlashOn = false;
        update();
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  @override
  close() async {
    await controller.dispose();
    Get.back();
  }

  @override
  pickPhotoFromGallery() async {
    isLoading = true;
    image = (await selectPhotoFromGallery(imagePicker: imagePicker));
    isLoading = false;
    update();
  }
}
