import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/class/posts_services.dart';
import 'package:grad_proj/core/functions/pick_and_capture_image.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

abstract class AddPostController extends GetxController {
  addPost();
  pickImageFromGallery();
  captureImageFromCamera();
  deletePickedImage();
}

class AddPostControllerImp extends AddPostController {
  PostsRepo postsRepo = Get.find();
  late TextEditingController controller;
  File? image;
  late ImagePicker imagePicker;
  bool isLoading = false;
  @override
  Future addPost() async {
    isLoading = true;
    update();
    await postsRepo.makePost(
        post: controller.text, file: image, postType: 'image');
    isLoading = false;
    update();
    Get.back();

  }

  @override
  void onInit() {
    controller = TextEditingController();
    imagePicker = ImagePicker();
    super.onInit();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  captureImageFromCamera() async {
    isLoading = true;
    image = (await capturePhotoFromCamera(imagePicker: imagePicker));
    isLoading = false;
    update();
  }

  @override
  pickImageFromGallery() async {
    isLoading = true;
    image = (await selectPhotoFromGallery(imagePicker: imagePicker));
    isLoading = false;
    update();
  }

  @override
  deletePickedImage() {
    image = null;
    update();
  }


}
