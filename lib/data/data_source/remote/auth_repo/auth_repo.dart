import 'package:dartz/dartz.dart';
import '../../../../core/class/failure.dart';
import '../../../models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> signUp(
      {required String email, required String password});
  Future<Either<Failure, void>> phoneAuth(
      {required String phoneNumber});
  Future<Either<Failure, void>> sentCode({required String sentCode});

  Future<Either<Failure, void>> logIn(
      {required String email, required String password});
  Future<Either<Failure, void>> resetPassword(
      {required String email});
  Future<Either<Failure, void>> googleSignIn();
  Future<Either<Failure, void>> facebookSignIn();
  Future<Either<Failure, void>> addUserToCollection(UserModel userModel);
  Future<Either<Failure, void>> logOut();
}
