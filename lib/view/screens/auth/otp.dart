import 'package:flutter/material.dart';
import '../../../core/constants/image_asset.dart';
import '../../widgets/auth/custom_otp_form.dart';

class OneTimePassword extends StatelessWidget {
  const OneTimePassword({Key? key}) : super(key: key);

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
              child: CustomOtpForm(),
            ),
          ),
        ),
      ]),
    );
  }
}


