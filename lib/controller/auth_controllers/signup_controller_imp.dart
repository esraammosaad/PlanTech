import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grad_proj/controller/auth_controllers/signup_controller.dart';
import 'package:grad_proj/core/class/update_user_data.dart';
import 'package:grad_proj/core/functions/show_snack_bar.dart';
import 'package:grad_proj/data/data_source/remote/auth_repo/auth_repo_imp.dart';
import 'package:grad_proj/data/models/user_model.dart';
import 'package:get/get.dart';
import '../../core/constants/app_routes.dart';
import '../../core/functions/awesome_dialog.dart';

class SignUpControllerImp extends SignUpController {
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late GlobalKey<FormState> formKey;
  late AutovalidateMode autoValidateMode;
  bool isNotVisible = true;
  AuthRepoImp authRepo = Get.find();
  UpdateUserData updateUserData = Get.find();
  bool isLoading = false;

  @override
  signUp(BuildContext context) async {
    if (formKey.currentState!.validate() &&
        passwordController.text == confirmPasswordController.text) {
      formKey.currentState!.save();
      isLoading = true;
      update();
      var result = await authRepo.signUp(
          email: emailController.text, password: passwordController.text);
      result.fold((l) {
        isLoading = false;
        update();

        showAwesomeDialog
          (okOnPress: (){},
            cancelOnPress: (){},
            context: context,
            dialogType: DialogType.error,
            title: l.errMessage,
            desc: '');

        update();
      }, (r) {
        isLoading = false;
        update();
        Get.offAllNamed(AppRoutes.logInScreen);
        showSnackBar('27'.tr, context);
        updateUserData.updateName(usernameController.text);
        updateUserData.updatePhotoUrl('https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png');
        authRepo.addUserToCollection(UserModel(
            name: usernameController.text,
            email: emailController.text,
            password: passwordController.text,
            image: FirebaseAuth.instance.currentUser?.photoURL ??
                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
            uid: FirebaseAuth.instance.currentUser?.uid ?? '', phoneNumber: ''));
      });
    }
    autoValidateMode = AutovalidateMode.always;
    update();
  }

  @override
  goToSignIn() {
    Get.offAllNamed(AppRoutes.logInScreen);
  }

  @override
  goToSignInWithPhoneNumber() {
    Get.offAllNamed(AppRoutes.signUpWithPhoneNumberScreen);
  }

  @override
  showPassword() {
    isNotVisible = !isNotVisible;
    update();
  }

  @override
  void onInit() {
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    formKey = GlobalKey();
    autoValidateMode = AutovalidateMode.disabled;
    super.onInit();
  }

  @override
  signUpWithGoogle(BuildContext context) async {
    var result = await authRepo.googleSignIn();
    result.fold((l) {
      showAwesomeDialog(
        cancelOnPress: (){},
          okOnPress: (){},
          context: context,
          dialogType: DialogType.error,
          title: l.errMessage,
          desc: '');
    }, (r) {
      Get.offAllNamed(AppRoutes.navBarScreen);
      showSnackBar('Success', context);
      authRepo.addUserToCollection(UserModel(
          name: FirebaseAuth.instance.currentUser?.displayName??'',
          email: FirebaseAuth.instance.currentUser?.email??'',
          password: 'gmail account without password',
          image: FirebaseAuth.instance.currentUser?.photoURL ??
              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
          uid: FirebaseAuth.instance.currentUser?.uid ?? '', phoneNumber: FirebaseAuth.instance.currentUser?.phoneNumber ?? ''));
    });
  }
}
