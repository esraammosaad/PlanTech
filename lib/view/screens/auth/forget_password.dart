import 'package:flutter/material.dart';
import 'package:grad_proj/core/constants/app_routes.dart';
import 'package:grad_proj/view/widgets/auth/custom_forget_password_form.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.offNamed(AppRoutes.logInScreen);
          },
        ),
      ),
      body: PopScope(
        onPopInvoked: (p) => Get.offNamed(AppRoutes.logInScreen),
        canPop: false,
        child: const SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomForgetPasswordForm(),
            ),
          ),
        ),
      ),
    );
  }
}
