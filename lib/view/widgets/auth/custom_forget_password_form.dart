import 'package:flutter/material.dart';
import 'package:grad_proj/controller/auth_controllers/forget_password_controller.dart';
import 'package:get/get.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/styles.dart';
import '../../../core/shared/custom_button.dart';
import 'custom_auth_text.dart';
import 'custom_text_form_field.dart';

class CustomForgetPasswordForm extends StatelessWidget {
  const CustomForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) => Form(
              autovalidateMode: controller.autoValidateMode,
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAuthText(
                      text: "Forgot Password",
                      subText:
                          "At our app, we take the security of your information seriously."),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                      hintText: 'Enter your Email',
                      onSave: (value) {},
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      errMassage: '12'.tr,
                      controller: controller.emailController),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                      text: '19'.tr,
                      onTap: () {
                        controller.enterEmail(context);
                      }),
                ],
              ),
            ));
  }
}