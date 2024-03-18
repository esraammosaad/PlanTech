import 'dart:async';
import 'package:grad_proj/core/constants/app_routes.dart';
import 'package:grad_proj/data/data_source/remote/auth_repo/auth_repo_imp.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

abstract class OtpController extends GetxController {
  checkCode(BuildContext context);
  goToHome();
  startTimer();
}

class OtpControllerImp extends OtpController {
  late GlobalKey<FormState> formKey;
  late StreamController<ErrorAnimationType> errorController;
  late AutovalidateMode autoValidateMode;
  late TextEditingController controller;
  String currentText = '';
  late String phoneNumber;
  bool isLoading = false;
  AuthRepoImp authRepo = Get.find();
  int counter = 60;

  @override
  void onInit() {
    formKey = GlobalKey();
    errorController = StreamController();
    autoValidateMode = AutovalidateMode.disabled;
    controller = TextEditingController();
    startTimer();
    super.onInit();
  }

  @override
  checkCode(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      isLoading = true;
      update();
      var result = await authRepo.sentCode(sentCode: currentText);
      result.fold((l) {
        isLoading = false;
        update();
        errorController.add(ErrorAnimationType.shake);
        autoValidateMode = AutovalidateMode.always;
        update();
      }, (r) {
        Get.offAllNamed(AppRoutes.navBarScreen);
        errorController.close();
      });
    } else {
      errorController.add(ErrorAnimationType.shake);
      autoValidateMode = AutovalidateMode.always;
      update();
    }
  }

  @override
  goToHome() {}

  @override
  startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counter > 0) {
        counter--;
        update();
      } else {
        timer.cancel();
      }
      update();
    });
  }
}
