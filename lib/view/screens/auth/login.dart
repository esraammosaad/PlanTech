import 'package:flutter/material.dart';
import 'package:grad_proj/core/constants/image_asset.dart';
import '../../widgets/auth/custom_login_form.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
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
              child: CustomLogInForm(),
            ),
          ),
        ),
      ]),
    );
  }
}
