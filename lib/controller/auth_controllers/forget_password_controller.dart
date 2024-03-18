import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:grad_proj/core/constants/app_routes.dart';
import '../../core/functions/awesome_dialog.dart';
import '../../data/data_source/remote/auth_repo/auth_repo_imp.dart';

abstract class ForgetPasswordController extends GetxController {
  enterEmail(BuildContext context);
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController emailController;
  late GlobalKey<FormState> formKey;
  late AutovalidateMode autoValidateMode;
  AuthRepoImp authRepo = Get.find();
  bool isLoading = false;


  @override
  void onInit() {
    emailController = TextEditingController();
    formKey = GlobalKey();
    autoValidateMode = AutovalidateMode.disabled;
    super.onInit();
  }

  @override
  enterEmail(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      isLoading = true;

      var result = await authRepo.resetPassword(email: emailController.text);
      result.fold((l) {
        isLoading = false;
        update();
        showAwesomeDialog(
          dialogType: DialogType.error,
          title: l.errMessage,
          desc: '',
          context: context,
          okOnPress: (){

          },
            cancelOnPress: (){

        }
        );
      },(r) {
        isLoading = false;
        update();
        showAwesomeDialog(
          cancelOnPress: (){


          },
          okOnPress: (){
            Get.offAllNamed(AppRoutes.logInScreen);

          },
          dialogType: DialogType.success,
          title: 'Check your email to reset your password',
          desc: '',
          context: context,
        );
      });
    }
    autoValidateMode = AutovalidateMode.always;
  }
}
