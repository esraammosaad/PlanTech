import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/styles.dart';
import '../../../core/shared/custom_button.dart';
import 'custom_auth_text.dart';
import 'custom_divider.dart';
import 'custom_signup_methods.dart';
import 'custom_text_form_field.dart';
import 'custom_text_rich.dart';

class CustomSignUpForm extends StatefulWidget {
  const CustomSignUpForm({
    super.key,
  });

  @override
  State<CustomSignUpForm> createState() => _CustomSignUpFormState();
}

class _CustomSignUpFormState extends State<CustomSignUpForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autoValidateMode,
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          Text("Sign up", style: Styles.textStyle36),
          const SizedBox(
            height: 16,
          ),
          const CustomAuthText(text: 'Enter email'),
          CustomTextFormField(
              onSave: (value) {},
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              obscureText: false,
              errMassage: 'please Enter Your Email',
              controller: emailController),
          const SizedBox(
            height: 16,
          ),
          const CustomAuthText(text: 'Enter Password'),
          CustomTextFormField(
              onSave: (value) {},
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              obscureText: true,
              errMassage: 'please Enter Your Password',
              controller: passwordController),
          const SizedBox(
            height: 16,
          ),
          const CustomAuthText(text: 'Re-enter Password'),
          CustomTextFormField(
              onSave: (value) {},
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              obscureText: true,
              errMassage: 'please Re-enter Your Password',
              controller: confirmPasswordController),
          const SizedBox(
            height: 32,
          ),
          CustomButton(
              text: 'Sign up',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                }
                autoValidateMode = AutovalidateMode.always;
                setState(() {});
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
                  'Or',
                  style: Styles.textStyle17,
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
                "Sign up with",
                style: Styles.textStyle14,
              )),
          const SizedBox(
            height: 15,
          ),
          const CustomSignUpMethods(),
          const SizedBox(
            height: 25,
          ),
          CustomTextRich(
              text: "Already have an account?",
              onTap: () => Get.back(),
              textTwo: ' Sign in'),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
