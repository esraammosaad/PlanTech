import 'package:flutter/material.dart';
import 'package:grad_proj/core/constants/image_asset.dart';
import 'package:grad_proj/view/widgets/auth/custom_signup_with_phone_form.dart';

class SignUpWithPhoneNumber extends StatelessWidget {
  const SignUpWithPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          AppImageAsset.loginImage,
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),

        const SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomSignUpWithPhoneForm(),
            ),
          ),
        ),
      ]),
    );
  }
}
