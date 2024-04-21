import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:grad_proj/core/class/failure.dart';
import 'package:grad_proj/data/models/comment_model.dart';
import 'package:grad_proj/data/models/post_model.dart';

abstract class PostRepo{
  Future<Either<Failure, List<PostModel>>> getAllPosts();
  Future<String?> makePost(
      {required String post,
        required File? file,
        required String postType});
  Future<void> editPost(
      {required String post,
        required String postId,
        required String fileUrl});
  Future<void> deletePost(
      {required String postId, required String? fileUrl});
  Future<Either<Failure, List<CommentModel>>> getPostComments(
      {required String postId});
  Future<String?> makeComment(
      {required String comment, required String postId});
  Future<Either<Failure, bool>> likeAndDisLike({
    required String postId,
    required List likes,
  });
  Future<Either<Failure, bool>> commentsLikeAndDisLike({
    required String commentId,
    required String postId,
    required List likes,
  });



}
