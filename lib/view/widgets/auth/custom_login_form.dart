import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/styles.dart';
import '../../../core/shared/custom_button.dart';
import '../../screens/auth/signup.dart';
import 'custom_auth_text.dart';
import 'custom_divider.dart';
import 'custom_signup_methods.dart';
import 'custom_text_form_field.dart';
import 'custom_text_rich.dart';

class CustomLogInForm extends StatefulWidget {
  const CustomLogInForm({
    super.key,
  });

  @override
  State<CustomLogInForm> createState() => _CustomLogInFormState();
}

class _CustomLogInFormState extends State<CustomLogInForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
          Text("Sign in", style: Styles.textStyle36),
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
            height: 32,
          ),
          CustomButton(
              text: 'Sign in',
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
            "Sign in with",
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
              text: "Don't have an account?",
              onTap: () => Get.to(() => const SignUp()),
              textTwo: ' Sign up'),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
