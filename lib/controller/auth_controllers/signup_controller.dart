import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController{

  signUp(BuildContext context);
  goToSignIn();
  signUpWithGoogle(BuildContext context);
  goToSignInWithPhoneNumber();
  showPassword();
}