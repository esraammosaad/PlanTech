import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:grad_proj/core/class/failure.dart';
import 'package:grad_proj/data/models/comment_model.dart';
import 'package:grad_proj/data/models/post_model.dart';
import 'package:uuid/uuid.dart';

class UpdateUserData {
  updateName(String username) async {
    await FirebaseAuth.instance.currentUser!.updateDisplayName(username);
  }

  updatePassword(String password) async {
    await FirebaseAuth.instance.currentUser!.updatePassword(password);
  }

  updatePhotoUrl(String image) async {
    await FirebaseAuth.instance.currentUser!.updatePhotoURL(image);
  }

  updatePhoneNum(PhoneAuthCredential phoneNum) async {
    await FirebaseAuth.instance.currentUser!.updatePhoneNumber(phoneNum);
  }

  updateEmail(String email) async {
    await FirebaseAuth.instance.currentUser!.verifyBeforeUpdateEmail(
      email,
    );
  }

  Future<void> editEmailInUsers({required String email}) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'email': email});
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> editPasswordInUsers({required String password}) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'password': password});
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> editPhoneNumberInUsers({required String phoneNumber}) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'phoneNumber': phoneNumber});
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> editUserPhotoInUsers({required String image}) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'image': image});
  }

  Future<void> editUserPhotoInPosts({required String image}) async {
    var result = await FirebaseFirestore.instance
        .collection('posts')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    for (int i = 0; i < result.docs.length; i++) {
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(PostModel.fromJson(result.docs[i].data()).postId)
          .update({'userImage': image});
    }
  }

  Future<void> editUserPhotoInComments({required String image}) async {
    QuerySnapshot<Map<String, dynamic>> commentsResult;
    var result = await FirebaseFirestore.instance.collection('posts').get();

    for (int i = 0; i < result.docs.length; i++) {
      commentsResult = await FirebaseFirestore.instance
          .collection('posts')
          .doc(PostModel.fromJson(result.docs[i].data()).postId)
          .collection('comments')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      if (commentsResult.docs.isNotEmpty) {
        for (int j = 0; j < commentsResult.docs.length; j++) {
          await FirebaseFirestore.instance
              .collection('posts')
              .doc(PostModel.fromJson(result.docs[i].data()).postId)
              .collection('comments')
              .doc(CommentModel.fromJson(commentsResult.docs[j].data())
              .commentId)
              .update({'userImage': image});
        }
      }
    }
  }

  Future<void> editNameInUsers({required String name}) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'name': name});
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> editNameInPosts({required String name}) async {
    try {
      var result = await FirebaseFirestore.instance
          .collection('posts')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      for (int i = 0; i < result.docs.length; i++) {
        await FirebaseFirestore.instance
            .collection('posts')
            .doc(PostModel.fromJson(result.docs[i].data()).postId)
            .update({'userName': name});
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> editNameInComments({required String name}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> commentsResult;
      var result = await FirebaseFirestore.instance.collection('posts').get();

      for (int i = 0; i < result.docs.length; i++) {
        commentsResult = await FirebaseFirestore.instance
            .collection('posts')
            .doc(PostModel.fromJson(result.docs[i].data()).postId)
            .collection('comments')
            .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .get();
        if (commentsResult.docs.isNotEmpty) {
          for (int j = 0; j < commentsResult.docs.length; j++) {
            await FirebaseFirestore.instance
                .collection('posts')
                .doc(PostModel.fromJson(result.docs[i].data()).postId)
                .collection('comments')
                .doc(CommentModel.fromJson(commentsResult.docs[j].data())
                    .commentId)
                .update({'userName': name});
          }
        }
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<Either<Failure, void>> editUserPhoto({File? image}) async {
    final String fileId = const Uuid().v1();
    final path = FirebaseStorage.instance.ref('users_images').child(fileId);
    try {
      if (image != null) {
        final taskSnapshot = await path.putFile(image);
        final downloadUrl = await taskSnapshot.ref.getDownloadURL();
        await editUserPhotoInUsers(image: downloadUrl);
        await editUserPhotoInPosts(image: downloadUrl);
        await editUserPhotoInComments(image: downloadUrl);
        await updatePhotoUrl(downloadUrl);
      }
      return right(null);
    } on FirebaseException catch (e) {
      return left(FirebaseFailure(errMessage: e.code.toString()));
    }
  }

  Future<Either<Failure, void>> editUserName({required String name}) async {
    try {
      await updateName(name);
      await editNameInUsers(name: name);
      await editNameInPosts(name: name);
      await editNameInComments(name: name);
      return right(null);
    } on FirebaseException catch (e) {
      return left(FirebaseFailure(errMessage: e.code.toString()));
    }
  }

  Future<Either<Failure, void>> editUserEmail({required String email}) async {
    try {
      await updateEmail(email);
      await editEmailInUsers(email: email);
      return right(null);
    } on FirebaseException catch (e) {
      return left(FirebaseFailure(errMessage: e.code.toString()));
    }
  }

  Future<Either<Failure, void>> editUserPassword(
      {required String password}) async {
    try {
      await updatePassword(password);

      await editPasswordInUsers(password: password);
      return right(null);
    } on FirebaseException catch (e) {
      return left(FirebaseFailure(errMessage: e.code.toString()));
    }
  }
  // Future<Either<Failure, void>> editUserPhoneNumber(
  //     {required String phoneNumber}) async {
  //   try {
  //     await updatePhoneNum(phoneNumber);
  //
  //     await editPasswordInUsers(password: password);
  //     return right(null);
  //   } on FirebaseException catch (e) {
  //     return left(FirebaseFailure(errMessage: e.toString()));
  //   }
  // }
}
