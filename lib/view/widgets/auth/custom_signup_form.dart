import 'package:flutter/material.dart';
import 'package:grad_proj/controller/auth_controllers/signup_controller_imp.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/view/widgets/auth/custom_auth_text.dart';
import '../../../core/constants/icon_asset.dart';
import '../../../core/constants/styles.dart';
import '../../../core/shared/custom_button.dart';
import '../../../core/shared/custom_loading_icon.dart';
import 'custom_divider.dart';
import 'custom_signup_methods.dart';
import 'custom_text_form_field.dart';
import 'custom_text_rich.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});
  @override
  Widget build(BuildContext context) {
    ThemeController themeController=Get.find();
    return GetBuilder<SignUpControllerImp>(
        builder: (controller) => controller.isLoading
            ? const CustomLoadingIcon(
                path: AppIcons.loadingIcon,
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Form(
                  autovalidateMode: controller.autoValidateMode,
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomAuthText(
                          text: 'Create Account',
                          subText:
                              "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!"),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextFormField(
                          hintText: 'Username',
                          onSave: (value) {},
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          errMassage: 'Please Enter Your Username',
                          controller: controller.usernameController),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextFormField(
                          hintText: 'Email',
                          onSave: (value) {},
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          errMassage: '12'.tr,
                          controller: controller.emailController),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextFormField(
                          hintText: 'Password',
                          icon: IconButton(
                            icon: Icon(
                              controller.isNotVisible
                                  ? Icons.visibility_off_outlined
                                  : Icons.remove_red_eye_outlined,
                              color: AppColors.greyColor,
                            ),
                            onPressed: () {
                              controller.showPassword();
                            },
                          ),
                          onSave: (value) {},
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          obscureText: controller.isNotVisible,
                          errMassage: '13'.tr,
                          controller: controller.passwordController),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextFormField(
                          hintText: 'Confirm Password',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '13'.tr;
                            } else if (controller.passwordController.text !=
                                controller.confirmPasswordController.text) {
                              return "Password doesn't match";
                            }
                            return null;
                          },
                          icon: IconButton(
                            icon: Icon(
                              controller.isNotVisible
                                  ? Icons.visibility_off_outlined
                                  : Icons.remove_red_eye_outlined,
                              color: AppColors.greyColor,
                            ),
                            onPressed: () {
                              controller.showPassword();
                            },
                          ),
                          onSave: (value) {},
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          obscureText: controller.isNotVisible,
                          errMassage: '13'.tr,
                          controller: controller.confirmPasswordController),
                      const SizedBox(
                        height: 32,
                      ),
                      CustomButton(
                          text: '11'.tr,
                          onTap: () {
                            controller.signUp(context);
                          }),
                      const SizedBox(
                        height: 52,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomDivider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              '8'.tr,
                              style: Styles.textStyle17(context).copyWith(color: themeController.isDarkMode.value?Colors.white70:Colors.black),
                            ),
                          ),
                          const CustomDivider(),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Center(
                          child: Text(
                        '${'11'.tr} ${'9'.tr}',
                        style: Styles.textStyle14(context).copyWith(color: themeController.isDarkMode.value?Colors.white:Colors.black),
                      )),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomSignUpMethods(
                          onTapPhone: () {
                            controller.goToSignInWithPhoneNumber();
                          },
                          onTapGoogle: () {
                            controller.signUpWithGoogle(context);
                          },
                          onTapFaceBook: () {}),
                      const SizedBox(
                        height: 25,
                      ),
                      CustomTextRich(
                          text: "${'15'.tr} ",
                          onTap: () {
                            controller.goToSignIn();
                          },
                          textTwo: '5'.tr),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ));
  }
}
