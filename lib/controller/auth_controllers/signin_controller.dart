import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SignInController extends GetxController{
  login(BuildContext context);
  goToSignUp();
  goToSignInWithPhoneNumber();
  signInWithGoogle(BuildContext context);
  goToForgetPassword();
  showPassword();


}