import 'package:flutter/material.dart';
import 'package:grad_proj/controller/auth_controllers/signup_with_phone_number_controller.dart';
import 'package:get/get.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/icon_asset.dart';
import '../../../core/constants/styles.dart';
import '../../../core/shared/custom_button.dart';
import '../../../core/shared/custom_loading_icon.dart';
import 'custom_auth_text.dart';
import 'custom_text_form_field.dart';

class CustomSignUpWithPhoneForm extends StatelessWidget {
  const CustomSignUpWithPhoneForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpWthPhoneNumControllerImp>(
        builder: (controller) => controller.isLoading
            ? const CustomLoadingIcon(path: AppIcons.loadingIcon,)
            :Form(
              autovalidateMode: controller.autoValidateMode,
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const CustomAuthText(
                      text: "Enter Your Phone",
                      subText:
                      "At our app, we take the security of your information seriously."),

                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    hintText: 'Your Phone',
                    prefixIcon: controller.chooseCountryCode(),
                      onSave: (value) {},
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      obscureText: false,
                      errMassage: '25'.tr,
                      controller: controller.phoneNumController),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                      text: '19'.tr,
                      onTap: () {
                        controller.signUpWithPhoneNumber(context);
                      }),
                ],
              ),
            ));
  }
}
