import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_proj/view/widgets/auth/custom_text_rich.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../core/constants/color.dart';
import '../../../core/constants/image_asset.dart';
import '../../../core/constants/styles.dart';
import '../../../core/shared/custom_button.dart';
import 'custom_auth_text.dart';

class CustomOtpForm extends StatefulWidget {
  const CustomOtpForm({Key? key}) : super(key: key);

  @override
  State<CustomOtpForm> createState() => _CustomOtpFormState();
}

class _CustomOtpFormState extends State<CustomOtpForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  StreamController<ErrorAnimationType> errorController = StreamController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  TextEditingController controller = TextEditingController();
  String currentText = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 45,
          ),
          const CustomAuthText(text: 'Enter OTP'),
          PinCodeTextField(
            autoFocus: true,
            appContext: context,
            pastedTextStyle: TextStyle(
              color: Colors.green.shade600,
              fontWeight: FontWeight.bold,
            ),
            length: 6,
            obscureText: true,
            obscuringCharacter: '*',
            obscuringWidget: SvgPicture.asset(
              AppImageAsset.splashImage,
              width: 1,
              height: 20,
            ),
            blinkWhenObscuring: true,
            animationType: AnimationType.fade,
            validator: (value) {
              if (value!.isEmpty) {
                return "";
              } else {
                return null;
              }
            },
            pinTheme: PinTheme(
              inactiveColor: AppColors.textFormColor,
              activeColor: AppColors.textFormColor,
              activeBorderWidth: 1,
              borderWidth: 1,
              disabledColor: AppColors.textFormColor,
              disabledBorderWidth: 1,
              errorBorderColor: Colors.red,
              selectedColor: AppColors.kPrimaryColor,
              errorBorderWidth: 1,
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 40,
              fieldWidth: 40,
            ),
            cursorColor: AppColors.textFormColor,
            animationDuration: const Duration(milliseconds: 300),
            errorAnimationController: errorController,
            controller: controller,
            keyboardType: TextInputType.number,
            onCompleted: (v) {
              debugPrint("Completed");
            },
            onChanged: (value) {
              debugPrint(value);
              setState(() {
                currentText = value;
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
              '2:08sec',
              style: Styles.textStyle17,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Please type the verification code sent to +49 156 820001302',
            textAlign: TextAlign.center,
            style: Styles.textStyle17,
          ),
          const SizedBox(
            height: 32,
          ),
          CustomButton(
              text: 'Submit',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                }
                errorController.add(ErrorAnimationType.shake);

                // Triggering error shake animation
                autoValidateMode = AutovalidateMode.always;
                setState(() {});
              }),
          const SizedBox(
            height: 50,
          ),
          CustomTextRich(
              text: 'Not received the code yet? ',
              textTwo: 'Resend',
              onTap: () {})
        ],
      ),
    );
  }
}
