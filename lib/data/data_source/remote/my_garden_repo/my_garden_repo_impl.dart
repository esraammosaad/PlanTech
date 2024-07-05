import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:grad_proj/core/class/failure.dart';
import 'package:grad_proj/data/data_source/remote/my_garden_repo/my_garden_repo.dart';
import 'package:grad_proj/data/models/image_model.dart';
import 'package:uuid/uuid.dart';

class MyGardenRepoImpl extends MyGardenRepo {
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  @override
  Future<String?> uploadImage(
      {required String result,
      required File? file,
      required String uid}) async {
    try {
      final String id = const Uuid().v1();
      final String uid = auth.currentUser!.uid;
      final DateTime time = DateTime.now();
      final String fileId = const Uuid().v1();
      final path = storage.ref('my_garden').child(fileId);
      if (file != null) {
        final taskSnapshot = await path.putFile(file);
        final downloadUrl = await taskSnapshot.ref.getDownloadURL();
        ImageModel imageModel = ImageModel(
            image: downloadUrl, id: id, result: result, time: time, uid: uid);
        await fireStore
            .collection('my_garden')
            .doc(id)
            .set(imageModel.toJson());
      }
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<Either<Failure, List<ImageModel>>> getMyGarden() async {
    try {
      List<ImageModel> data = [];

       fireStore
          .collection('my_garden')
          .where('uid', isEqualTo: auth.currentUser!.uid).orderBy('time', descending: true)
          .snapshots()
          .listen((event) {
        data.clear();
        for (int i = 0; i < event.docs.length; i++) {
          data.add(ImageModel.fromJson(event.docs[i].data()));
        }
      });

      return Right(data);
    } on Exception catch (e) {
      return Left(FirebaseFailure(errMessage: e.toString()));
    }
  }


  @override
  Future<void> deleteImage(
      {required String id, required String? fileUrl}) async {
    try {
      await fireStore.collection('my_garden').doc(id).delete();
      if (fileUrl != '' && fileUrl != null) {
        FirebaseStorage.instance.refFromURL(fileUrl).delete();
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
