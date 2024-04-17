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

class PostsRepo {
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

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
      return e.toString();
    }
  }

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

  Future<void> deletePost(
      {required String postId, required String? fileUrl}) async {
    try {
      await fireStore.collection('posts').doc(postId).delete();
      if (fileUrl != ''&& fileUrl!=null) {
        FirebaseStorage.instance.refFromURL(fileUrl).delete();
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

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
