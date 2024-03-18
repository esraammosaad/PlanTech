import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_routes.dart';
import '../../widgets/auth/custom_signup_with_phone_form.dart';

class SignUpWithPhoneNumber extends StatelessWidget {
  const SignUpWithPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
        canPop: false,
        onPopInvoked: (p)=>Get.offNamed(AppRoutes.logInScreen),
        child: const SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomSignUpWithPhoneForm(),
            ),
          ),
        ),
      ),
    );
  }
}
