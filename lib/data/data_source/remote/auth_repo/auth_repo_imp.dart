import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grad_proj/core/class/failure.dart';
import 'package:grad_proj/core/functions/check_internet.dart';
import 'package:get/get.dart';
import '../../../../core/class/firebase_auth_services.dart';
import '../../../models/user_model.dart';
import 'auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  FirebaseAuthServices fireBaseServices = Get.find();
  late String verifyId;
  @override
  Future<Either<Failure, void>> logIn(
      {required String email, required String password}) async {
    if (await checkInternet()) {
      try {
        UserCredential credential =
            await fireBaseServices.loginUser(email: email, password: password);
        if (credential.user!.emailVerified) {
          return right(null);
        } else {
          return left(
              FirebaseFailure(errMessage: 'Please verify your email address.'));
        }
      } on FirebaseAuthException catch (e) {
        if (e.message.toString() ==
            'The supplied auth credential is incorrect, malformed or has expired.') {
          return left(FirebaseFailure(
              errMessage:
                  'Wrong Email or Password Provided , Please Try Again or Create An Account.'));
        } else {
          return left(FirebaseFailure(errMessage: e.message.toString()));
        }
      }
    } else {
      return left(InternetFailure(errMessage: 'Check Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, void>> signUp(
      {required String email, required String password}) async {
    if (await checkInternet()) {
      try {
        await fireBaseServices.registerUser(email: email, password: password);
        return right(null);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          return left(FirebaseFailure(
              errMessage: 'The password provided is too weak.'));
        } else if (e.code == 'email-already-in-use') {
          return left(FirebaseFailure(
              errMessage: 'The account already exists for that email.'));
        } else {
          return left(FirebaseFailure(errMessage: e.toString()));
        }
      } catch (e) {
        return left(FirebaseFailure(errMessage: 'The account already exists for that email.'));
      }
    } else {
      return left(InternetFailure(errMessage: 'Check Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, String>> facebookSignIn() async {
    if (await checkInternet()) {
      try {
        await fireBaseServices.signInWithFaceBook();
        return right('success');
      } on FirebaseAuthException catch (e) {
        return left(FirebaseFailure(errMessage: e.code));
      } catch (e) {
        return left(FirebaseFailure(errMessage: e.toString()));
      }
    } else {
      return left(InternetFailure(errMessage: 'Check Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, String>> googleSignIn() async {
    if (await checkInternet()) {
      try {
        await fireBaseServices.signInWithGoogle();
        return right('success');
      } on FirebaseAuthException catch (e) {
        return left(FirebaseFailure(errMessage: e.code));
      } catch (e) {
        return left(FirebaseFailure(errMessage: e.toString()));
      }
    } else {
      return left(InternetFailure(errMessage: 'Check Internet Connection'));
    }
  }

  @override
  logOut() async {
    if (await checkInternet()) {
      try {
        await fireBaseServices.logOutUser();
        return right(null);
      } on FirebaseException catch (e) {
        return left(FirebaseFailure(errMessage: e.toString()));
      }
    } else {
      return left(InternetFailure(errMessage: 'Check Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({required String email}) async {
    if (await checkInternet()) {
      try {
        await fireBaseServices.resetPassword(email: email);
        return right(null);
      } on FirebaseException catch (_) {
        return left(FirebaseFailure(errMessage: 'Enter a valid Email'));
      } catch (e) {
        return left(FirebaseFailure(errMessage: e.toString()));
      }
    } else {
      return left(InternetFailure(errMessage: 'Check Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, void>> sentCode({required String sentCode}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (await checkInternet()) {
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verifyId, smsCode: sentCode);
        await auth.signInWithCredential(credential);
        return right(null);
      } on FirebaseAuthException catch (e) {
        return left(FirebaseFailure(errMessage: e.toString()));
      } catch (e) {
        return left(FirebaseFailure(errMessage: e.toString()));
      }
    } else {
      return left(InternetFailure(errMessage: 'Check Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, void>> phoneAuth({
    required String phoneNumber,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (await checkInternet()) {
      try {
        await fireBaseServices.phoneAuth(
          phoneNum: phoneNumber,
          verificationCompleted: (credential) async {
            await auth.signInWithCredential(credential);
          },
          verificationFailed: (e) async {
            if (e.code == 'invalid-phone-number') {
              // throw FirebaseAuthException(
              //     code: 'The provided phone number is not valid.');
            }
          },
          codeSent: (verificationId, resendToken) async {
            verifyId = verificationId;
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            verifyId = verificationId;
          },
        );

        return right(null);
      } on FirebaseAuthException catch (e) {
        return left(FirebaseFailure(errMessage: e.code));
      }
    } else {
      return left(InternetFailure(errMessage: 'Check Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, void>> addUserToCollection(UserModel userModel) async {
    if (await checkInternet()) {
    try {
    await fireBaseServices.addUsersCollection(userModel);

    return right(null);
    } on FirebaseAuthException catch (e) {
    return left(FirebaseFailure(errMessage: e.code));
    }catch (e){
      return left(FirebaseFailure(errMessage: e.toString()));

    }
    } else {
    return left(InternetFailure(errMessage: 'Check Internet Connection'));
    }
  }
}
