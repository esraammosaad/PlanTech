import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:grad_proj/data/data_source/remote/post_repo/post_repo.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import '../../../../core/class/failure.dart';
import '../../../models/comment_model.dart';
import '../../../models/post_model.dart';

class PostsRepoImpl extends PostRepo {
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  @override
  Future<Either<Failure, List<PostModel>>> getAllPosts() async {
    try {
      List<PostModel> data = [];

      fireStore
          .collection('posts')
          .orderBy('time', descending: true)
          .snapshots()
          .listen((event) {
        data.clear();
        for (int i = 0; i < event.docs.length; i++) {
          data.add(PostModel.fromJson(event.docs[i].data()));
        }
      });

      return Right(data);
    } on Exception catch (e) {
      return Left(FirebaseFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PostModel>>> getMyPosts() async {
    try {
      List<PostModel> data = [];

      fireStore
          .collection('posts').where('uid',isEqualTo:auth.currentUser!.uid,)
          .orderBy('time', descending: true)
          .snapshots()
          .listen((event) {
        data.clear();
        for (int i = 0; i < event.docs.length; i++) {
          data.add(PostModel.fromJson(event.docs[i].data()));
        }
      });

      return Right(data);
    } on Exception catch (e) {
      return Left(FirebaseFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<String?> makePost(
      {required String post,
      required File? file,
      required String postType}) async {
    try {
      final String postId = const Uuid().v1();
      final String uid = auth.currentUser!.uid;
      final DateTime time = DateTime.now();
      final String fileId = const Uuid().v1();
      final path = storage.ref(postType).child(fileId);
      if (file != null) {
        final taskSnapshot = await path.putFile(file);
        final downloadUrl = await taskSnapshot.ref.getDownloadURL();
        PostModel postModel = PostModel(
            postType: postType,
            fileUrl: downloadUrl,
            likes: [],
            postId: postId,
            post: post,
            userName: auth.currentUser?.displayName,
            time: time,
            userImage: auth.currentUser?.photoURL,
            uid: uid);
        await fireStore.collection('posts').doc(postId).set(postModel.toJson());
      } else {
        PostModel postModel = PostModel(
            postType: postType,
            fileUrl: '',
            likes: [],
            postId: postId,
            post: post,
            userName: auth.currentUser?.displayName,
            time: time,
            userImage: auth.currentUser?.photoURL,
            uid: uid);
        await fireStore.collection('posts').doc(postId).set(postModel.toJson());
      }
      return null;
    } catch (e) {
      return e.toString();  }  }

  @override
  Future<void> editPost(
      {required String post,
      required String postId,
      required String fileUrl}) async {
    try {
      await fireStore
          .collection('posts')
          .doc(postId)
          .update({'post': post, 'fileUrl': fileUrl});
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> deletePost(
      {required String postId, required String? fileUrl}) async {
    try {
      var result = await fireStore
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .get();
      for (int i = 0; i < result.docs.length; i++) {
        await FirebaseFirestore.instance
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(CommentModel.fromJson(result.docs[i].data()).commentId)
            .delete();
      }
      await fireStore.collection('posts').doc(postId).delete();
      if (fileUrl != '' && fileUrl != null) {
        FirebaseStorage.instance.refFromURL(fileUrl).delete();
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<Either<Failure, List<CommentModel>>> getPostComments(
      {required String postId}) async {
    try {
      List<CommentModel> data = [];

      fireStore
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .orderBy('time', descending: true)
          .snapshots()
          .listen((event) {
        data.clear();
        for (int i = 0; i < event.docs.length; i++) {
          data.add(CommentModel.fromJson(event.docs[i].data()));
        }
      });

      return Right(data);
    } on Exception catch (e) {
      return Left(FirebaseFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<String?> makeComment(
      {required String comment, required String postId}) async {
    try {
      final String commentId = const Uuid().v1();
      final String uid = auth.currentUser!.uid;
      final DateTime time = DateTime.now();
      CommentModel commentModel = CommentModel(
          commentId: commentId,
          comment: comment,
          userName: auth.currentUser?.displayName,
          time: time,
          userImage: auth.currentUser?.photoURL,
          uid: uid,
          likes: []);
      await fireStore
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .doc(commentId)
          .set(commentModel.toJson());

      return null;
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<void> deleteComment(
      {required String commentId, required String postId}) async {
    try {
      await fireStore
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .doc(commentId)
          .delete();
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }


  @override
  Future<void> editComment({
    required String comment,
    required String postId,
    required String commentId,
  }) async {
    try {
      await fireStore
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .doc(commentId)
          .update({
        'post': comment,
      });
      print('================================================');
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<Either<Failure, bool>> likeAndDisLike({
    required String postId,
    required List likes,
  }) async {
    try {
      final uid = auth.currentUser?.uid;
      if (likes.contains(uid)) {
        await fireStore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid])
        });
        return right(false);
      } else {
        await fireStore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid])
        });
        return right(true);
      }
    } catch (e) {
      return left(FirebaseFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> commentsLikeAndDisLike({
    required String commentId,
    required String postId,
    required List likes,
  }) async {
    try {
      final uid = auth.currentUser?.uid;
      if (likes.contains(uid)) {
        await fireStore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .update({
          'likes': FieldValue.arrayRemove([uid])
        });
        return right(false);
      } else {
        await fireStore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .update({
          'likes': FieldValue.arrayUnion([uid])
        });
        return right(true);
      }
    } catch (e) {
      return left(FirebaseFailure(errMessage: e.toString()));
    }
  }
}
