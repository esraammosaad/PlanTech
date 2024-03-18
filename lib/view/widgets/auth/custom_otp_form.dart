import 'package:flutter/material.dart';
import 'package:grad_proj/controller/auth_controllers/otp_controller.dart';
import 'package:grad_proj/controller/auth_controllers/signup_with_phone_number_controller.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/icon_asset.dart';
import '../../../core/constants/styles.dart';
import '../../../core/shared/custom_button.dart';
import '../../../core/shared/custom_loading_icon.dart';
import 'custom_auth_text.dart';
import 'custom_text_rich.dart';

class CustomOtpForm extends StatefulWidget {
  const CustomOtpForm({Key? key}) : super(key: key);

  @override
  State<CustomOtpForm> createState() => _CustomOtpFormState();
}

class _CustomOtpFormState extends State<CustomOtpForm> {
  @override
  Widget build(BuildContext context) {
    SignUpWthPhoneNumControllerImp signUpWthPhoneNumController = Get.find();
    return GetBuilder<OtpControllerImp>(
        builder: (controller) => controller.isLoading
            ? const CustomLoadingIcon(
                path: AppIcons.loadingIcon,
              )
            : Form(
                key: controller.formKey,
                autovalidateMode: controller.autoValidateMode,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    CustomAuthText(text: '20'.tr, subText: '',),
                    PinCodeTextField(
                      autoFocus: true,
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      animationType: AnimationType.fade,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        inactiveColor: AppColors.kPrimaryColor,
                        activeColor: AppColors.kPrimaryColor,
                        activeBorderWidth: 1,
                        borderWidth: 1,
                        disabledColor: AppColors.kPrimaryColor,
                        disabledBorderWidth: 1,
                        errorBorderColor: Colors.red,
                        selectedColor: AppColors.kPrimaryColor,
                        errorBorderWidth: 1,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 40,
                        fieldWidth: 40,
                      ),
                      cursorColor: AppColors.kPrimaryColor,
                      animationDuration: const Duration(milliseconds: 300),
                      errorAnimationController: controller.errorController,
                      controller: controller.controller,
                      keyboardType: TextInputType.number,
                      onCompleted: (v) {
                        debugPrint("Completed");
                      },
                      onSaved: (value) {},
                      onChanged: (value) {
                        debugPrint(value);
                        setState(() {
                          controller.currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        return true;
                      },
                    ),
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Text(
                        '${controller.counter}sec',
                        style: Styles.textStyle17,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      '26'.tr,
                      textAlign: TextAlign.center,
                      style: Styles.textStyle17,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    CustomButton(
                        text: '19'.tr,
                        onTap: () {
                          controller.checkCode(context);
                        }),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomTextRich(
                        text: '22'.tr,
                        textTwo: '23'.tr,
                        onTap: () {
                          signUpWthPhoneNumController
                              .signUpWithPhoneNumber(context);
                        })
                  ],
                ),
              ));
  }
}
