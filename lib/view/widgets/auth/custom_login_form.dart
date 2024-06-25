import 'package:flutter/material.dart';
import 'package:grad_proj/controller/auth_controllers/signin_controller_imp.dart';
import 'package:get/get.dart';
import 'package:grad_proj/core/class/them_controller.dart';
import 'package:grad_proj/core/constants/color.dart';
import 'package:grad_proj/view/widgets/auth/custom_auth_text.dart';
import '../../../core/constants/icon_asset.dart';
import '../../../core/constants/styles.dart';
import '../../../core/shared/custom_button.dart';
import '../../../core/shared/custom_loading_icon.dart';
import 'custom_divider.dart';
import 'custom_forget_password_button.dart';
import 'custom_signup_methods.dart';
import 'custom_text_form_field.dart';
import 'custom_text_rich.dart';

class CustomLogInForm extends StatelessWidget {
  const CustomLogInForm({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController=Get.find();
    return GetBuilder<SignInControllerImp>(
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
                     const CustomAuthText(text: "Welcome Back",subText: "We're excited to have you back, can't wait to see what you've been up to since you last logged in."),
                      const SizedBox(
                        height: 30,
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
                        height: 20,
                      ),
                      CustomTextFormField(
                          hintText: 'Password',
                          icon: IconButton(
                            icon: Icon(
                              controller.isNotVisible
                                  ? Icons.visibility_off_outlined
                                  : Icons.remove_red_eye_outlined,
                              color: AppColors.kGreyColor,
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
                        height: 32,
                      ),
                      CustomButton(
                          text: 'Login',
                          onTap: () {
                            controller.login(context);
                          }),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomForgetPasswordButton(onPressed: () {
                        controller.goToForgetPassword();
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomDivider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              '8'.tr,
                              style: Styles.textStyle17(context).copyWith(color: themeController.isDarkMode.value
                                  ? Colors.white70
                                  : Colors.black),
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
                        '${'5'.tr} ${'9'.tr}',
                        style: Styles.textStyle14(context).copyWith(color: themeController.isDarkMode.value
                            ? Colors.white
                            : Colors.black),
                      )),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomSignUpMethods(
                          onTapPhone: () {
                            controller.goToSignInWithPhoneNumber();
                          },
                          onTapFaceBook: () {},
                          onTapGoogle: () {
                            controller.signInWithGoogle(context);
                          }),
                      const SizedBox(
                        height: 25,
                      ),
                      CustomTextRich(
                          text: '${"10".tr} ',
                          onTap: () {
                            controller.goToSignUp();
                          },
                          textTwo: '11'.tr),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ));
  }
}
