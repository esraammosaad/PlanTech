import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_proj/view/screens/auth/otp.dart';
import '../../../core/shared/custom_button.dart';
import 'custom_auth_text.dart';
import 'custom_text_form_field.dart';

class CustomSignUpWithPhoneForm extends StatefulWidget {
  const CustomSignUpWithPhoneForm({
    super.key,
  });

  @override
  State<CustomSignUpWithPhoneForm> createState() =>
      _CustomSignUpWithPhoneFormState();
}

class _CustomSignUpWithPhoneFormState extends State<CustomSignUpWithPhoneForm> {
  TextEditingController phoneNumController = TextEditingController();
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
          SizedBox(height: MediaQuery.of(context).size.height*0.25,),
          const CustomAuthText(text: 'Please Enter Your Phone Number'),
          CustomTextFormField(
              onSave: (value) {},
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              obscureText: false,
              errMassage: 'please Enter Your Phone Number',
              controller: phoneNumController),
          const SizedBox(
            height: 40,
          ),
          CustomButton(
              text: 'Confirm',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  Get.to(()=>const OneTimePassword());
                }
                autoValidateMode = AutovalidateMode.always;
                setState(() {});
              }),
        ],
      ),
    );
  }
}
