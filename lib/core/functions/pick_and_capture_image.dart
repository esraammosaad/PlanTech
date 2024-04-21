import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> selectPhotoFromGallery(
    {required ImagePicker? imagePicker}) async {
  File? image;
  try {
    XFile? pickedFile = await imagePicker!
        .pickImage(source: ImageSource.gallery, maxHeight: 720, maxWidth: 720);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
  } on Exception catch (e) {
    debugPrint(e.toString());
  }

  return image;
}

Future<File?> capturePhotoFromCamera(
    {required ImagePicker? imagePicker}) async {
  File? image;
  try {
    XFile? pickedFile =
        await imagePicker!.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
  } on Exception catch (e) {
    debugPrint(e.toString());
  }
  return image;
}
