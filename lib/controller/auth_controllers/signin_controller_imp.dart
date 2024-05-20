import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grad_proj/controller/auth_controllers/signin_controller.dart';
import 'package:grad_proj/core/constants/app_routes.dart';
import 'package:get/get.dart';
import '../../core/functions/awesome_dialog.dart';
import '../../data/data_source/remote/auth_repo/auth_repo_imp.dart';
import '../../data/models/user_model.dart';

class SignInControllerImp extends SignInController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;
  late AutovalidateMode autoValidateMode;
  bool isNotVisible = true;
  AuthRepoImp authRepo = Get.find();
  bool isLoading = false;

  @override
  goToSignUp() {
    Get.offAllNamed(AppRoutes.signUpScreen);
  }

  @override
  showPassword() {
    isNotVisible = !isNotVisible;
    update();
  }

  @override
  goToSignInWithPhoneNumber() {
    Get.offNamed(AppRoutes.signUpWithPhoneNumberScreen);
  }

  @override
  login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      isLoading = true;
      update();
      var result = await authRepo.logIn(
          email: emailController.text, password: passwordController.text);
      result.fold((l) async {
        isLoading = false;
        update();

          await showAwesomeDialog(
            cancelOnPress: (){},
              okOnPress: (){},
              context: context,
              dialogType: DialogType.error,
              title: l.errMessage,
              desc: '');
          update();

      }, (r) {
        isLoading = false;
        update();
        Get.offAllNamed(AppRoutes.navBarScreen);

      });
    }
    autoValidateMode = AutovalidateMode.always;
    update();

  }

  @override
  goToForgetPassword() {
    Get.offNamed(AppRoutes.forgetPasswordScreen);
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey();
    autoValidateMode = AutovalidateMode.disabled;
    super.onInit();
  }

  @override
  signInWithGoogle(BuildContext context) async {
    isLoading = true;
    update();

    var result=await authRepo.googleSignIn();
    result.fold((l) async {
      isLoading = false;
      update();

      await showAwesomeDialog(context: context, dialogType: DialogType.error, title: l.errMessage, desc: '',cancelOnPress: (){

      },okOnPress: (){});
    }, (r)
    {
      isLoading = false;
      update();
      Get.offAllNamed(AppRoutes.navBarScreen);
      authRepo.addUserToCollection(UserModel(
          name: FirebaseAuth.instance.currentUser?.displayName??'',
          email: FirebaseAuth.instance.currentUser?.email??'',
          password: 'gmail account without password',
          image: FirebaseAuth.instance.currentUser?.photoURL ??
              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
          uid: FirebaseAuth.instance.currentUser?.uid ?? '', phoneNumber: FirebaseAuth.instance.currentUser?.phoneNumber ?? '', header: 'https://www.benaranurseries.com/media/wysiwyg/Blogs/Blog_internal_Monstera_delicosa.jpg'));


    }
    );
  }
}
