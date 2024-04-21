import'dart:io';
import 'package:dartz/dartz.dart';
import 'package:grad_proj/data/models/image_model.dart';
import '../../../../core/class/failure.dart';

abstract class MyGardenRepo{
  Future<Either<Failure, List<ImageModel>>> getMyGarden();

  Future<String?> uploadImage(
      {required String result,
        required File? file,
        required String uid});

  Future<void> deleteImage(
      {required String id, required String? fileUrl});

}